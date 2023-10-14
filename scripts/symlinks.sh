#!/bin/bash

config_file="scripts/symlinks_config.conf"

. scripts/utils.sh

create_symlinks() {
    info "Creating symbolic links..."

    # Read dotfile links from the config file
    while IFS=: read -r source target || [ -n "$source" ]; do

        # Skip empty or invalid lines in the config file
        if [[ -z "$source" || -z "$target" || "$source" == \#* ]]; then
            continue
        fi

        # Evaluate variables
        source=$(eval echo "$source")
        target=$(eval echo "$target")

        # Check if the source file exists
        if [ ! -e "$source" ]; then
            error "Error: Source file '$source' not found. Skipping link creation for '$target'."
            continue
        fi

        # Check if the symbolic link already exists
        if [ -L "$target" ]; then
            warning "Symbolic link already exists: $target"
        elif [ -f "$target" ]; then
            warning "File already exists: $target"
        else
            # Extract the directory portion of the target path
            target_dir=$(dirname "$target")

            # Check if the target directory exists, and if not, create it
            if [ ! -d "$target_dir" ]; then
                mkdir -p "$target_dir"
                info "Created directory: $target_dir"
            fi

            # Create the symbolic link
            ln -s "$source" "$target"
            success "Created symbolic link: $target"
        fi
    done <"$config_file"
}

delete_symlinks() {
    info "Deleting symbolic links..."

    while IFS=: read -r _ target || [ -n "$target" ]; do

        # Skip empty and invalid lines
        if [[ -z "$target" ]]; then
            continue
        fi

        # Evaluate variables
        target=$(eval echo "$target")

        # Check if the symbolic link or file exists
        if [ -L "$target" ] || { [ "$include_files" == true ] && [ -f "$target" ]; }; then
            # Remove the symbolic link or file
            rm -rf "$target"
            success "Deleted: $target"
        else
            warning "Not found: $target"
        fi
    done <"$config_file"
}

# Parse arguments
if [ "$(basename "$0")" = "$(basename "${BASH_SOURCE[0]}")" ]; then
    case "$1" in
    "--create")
        create_symlinks
        ;;
    "--delete")
        if [ "$2" == "--include-files" ]; then
            include_files=true
        fi
        delete_symlinks
        ;;
    "--help")
        # Display usage/help message
        echo "Usage: $0 [--create | --delete [--include-files] | --help]"
        ;;
    *)
        # Display an error message for unknown arguments
        error "Error: Unknown argument '$1'"
        error "Usage: $0 [--create | --delete [--include-files] | --help]"
        exit 1
        ;;
    esac
fi
