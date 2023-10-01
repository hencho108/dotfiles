#!/bin/bash

. scripts/utils.sh

install_brewfile_apps() {
	local brewfile="Brewfile"

	# Check if Homebrew is installed
	if ! command -v brew &>/dev/null; then
		error "Homebrew is not installed. Please install Homebrew first."
		return 1
	fi

	# Check if Brewfile exists in the current directory
	if [ ! -f "$brewfile" ]; then
		error "Brewfile not found in the current directory."
		return 1
	fi

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
}

if [ "$(basename "$0")" = "$(basename "${BASH_SOURCE[0]}")" ]; then
	install_brewfile_apps
fi
