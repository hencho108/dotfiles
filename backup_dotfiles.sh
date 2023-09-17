#!/bin/bash

# Set the backup directory name
backup_base_dir="${HOME}/code/dotfiles"

# Create the backup directory if it doesn't exist
mkdir -p "${backup_base_dir}"

# Define a function to copy a source file to a target path within the backup directory
copy_to_backup() {
	src_file="$1"
	target_path="${backup_base_dir}/$2"
	target_dir=$(dirname "${target_path}")

	# Create the target directory if it doesn't exist
	mkdir -p "${target_dir}"

	# Copy the file/directory, excluding .config/nvim/db_ui
	rsync -av --exclude='db_ui' "${HOME}/${src_file}" "${target_path}"
}

# Call the copy_to_backup function for each dotfile/directory you want to back up,
# specifying the source file and the target path within the backup directory
copy_to_backup ".zshrc" "zsh/.zshrc"
copy_to_backup ".config/nvim/" "nvim"
copy_to_backup ".tmux.conf" "tmux/.tmux.conf"
copy_to_backup ".iterm" "iterm"

echo "Dotfiles backed up in ${backup_base_dir} directory."
