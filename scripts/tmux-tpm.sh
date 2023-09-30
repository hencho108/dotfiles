#!/bin/bash

. scripts/utils.sh

install_tmux_tpm() {
	local tpm_path="$HOME/.tmux/plugins/tpm"

	# Check if TPM is already installed
	if [ -d "$tpm_path" ]; then
		warning "TPM is already installed."
	else
		# Install TPM
		info "Installing TPM..."
		git clone https://github.com/tmux-plugins/tpm "$tpm_path"
		success "TPM installed successfully."
	fi
}

if [ "$(basename "$0")" = "$(basename "${BASH_SOURCE[0]}")" ]; then
	install_tmux_tpm
fi
