#!/bin/bash

. scripts/utils.sh

install_oh_my_zsh() {
	if [[ ! -f "$HOME/.zshrc" ]]; then
		info "Installing oh my zsh..."
		ZSH=~/.oh-my-zsh ZSH_DISABLE_COMPFIX=true sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

		chmod 744 ~/.oh-my-zsh/oh-my-zsh.sh

	else
		warning "oh-my-zsh already installed"
	fi
}

install_p10k() {
	local p10k_dir="$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
	if [[ ! -d "$p10k_dir" ]]; then
		info "Installing PowerLevel10k Theme for Oh My Zsh..."
		git clone https://github.com/romkatv/powerlevel10k.git "$p10k_dir"
	else
		warning "Powerlevel10k is already installed"
	fi
}

if [ "$(basename "$0")" = "$(basename "${BASH_SOURCE[0]}")" ]; then
	install_oh_my_zsh
	install_p10k
fi
