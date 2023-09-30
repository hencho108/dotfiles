#!/bin/bash

. scripts/utils.sh

install_colorls() {
	# Check if Homebrew is installed
	if ! command -v brew &>/dev/null; then
		error "Homebrew is not installed. Please install Homebrew first."
		return 1
	fi

	# Check if Ruby is already installed
	if brew list --formula | grep -q 'ruby'; then
		warning "Ruby is already installed via Homebrew."
	else
		info "Installing Ruby via Homebrew..."
		brew install ruby
		success "Ruby installed successfully."
	fi

	# Check if colorls is installed
	if ! gem list colorls -i &>/dev/null; then
		info "colorls is not installed. Installing colorls..."
		gem install colorls
		success "colorls installed successfully."
	else
		warning "colorls is already installed."
	fi
}

if [ "$(basename "$0")" = "$(basename "${BASH_SOURCE[0]}")" ]; then
	install_colorls
fi
