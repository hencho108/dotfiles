#!/bin/bash

# Get the absolute path of the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

. $SCRIPT_DIR/utils.sh

# Paths to the custom formulae and casks directories
FORMULAE_DIR="$SCRIPT_DIR/../homebrew/custom-formulae"
CASKS_DIR="$SCRIPT_DIR/../homebrew/custom-casks"

install_custom() { # Function to install custom formulas and casks
    package_name=$1
    is_cask=$2

    if $is_cask && [ -f "$CASKS_DIR/$package_name.rb" ]; then
        info "Installing custom cask: $package_name"
        brew install --cask "$CASKS_DIR/$package_name.rb"
    elif ! $is_cask && [ -f "$FORMULAE_DIR/$package_name.rb" ]; then
        info "Installing custom formula: $package_name"
        brew install "$FORMULAE_DIR/$package_name.rb"
    else
        error "File not found for package: $package_name"
        exit 1
    fi
}

install_custom_formulae() {
    # Get the list of custom formulae from FORMULAe_DIR
    custom_formulae=()
    if [ -d "$FORMULAE_DIR" ]; then
        for file in "$FORMULAE_DIR"/*.rb; do
            [ -e "$file" ] || continue
            custom_formulae+=("$(basename "${file%.rb}")")
        done
    fi

    for formula in "${custom_formulae[@]}"; do
        install_custom "$formula" false
    done
}

install_custom_casks() {
    # Get the list of custom casks from CASKS_DIR
    custom_casks=()
    if [ -d "$CASKS_DIR" ]; then
        for file in "$CASKS_DIR"/*.rb; do
            [ -e "$file" ] || continue
            custom_casks+=("$(basename "${file%.rb}")")
        done
    fi

    for cask in "${custom_casks[@]}"; do
        install_custom "$cask" true
    done
}

run_brew_bundle() {
    brewfile="$SCRIPT_DIR/../homebrew/Brewfile"
    if [ -f $brewfile ]; then
        # Run `brew bundle check`
        local check_output
        check_output=$(brew bundle check --file="$brewfile" 2>&1)

        # Check if "The Brewfile's dependencies are satisfied." is contained in the output
        if echo "$check_output" | grep -q "The Brewfile's dependencies are satisfied."; then
            warning "The Brewfile's dependencies are already satisfied."
        else
            info "Satisfying missing dependencies with 'brew bundle install'..."
            brew bundle install --file="$brewfile"
        fi
    else
        error "Brewfile not found"
        return 1
    fi
}

if [ "$(basename "$0")" = "$(basename "${BASH_SOURCE[0]}")" ]; then
    # Check if Homebrew is installed
    if ! command -v brew &>/dev/null; then
        error "Homebrew is not installed. Please install Homebrew first."
        exit 1
    fi
    install_custom_formulae
    install_custom_casks
    run_brew_bundle
fi
