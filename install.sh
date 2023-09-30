#!/bin/bash

. scripts/utils.sh

install_xcode() {
	info "Installing Apple's CLI tools (prerequisites for Git and Homebrew)..."
	if xcode-select -p >/dev/null; then
		warning "xcode is already installed"
	else
		xcode-select --install
		sudo xcodebuild -license accept
	fi
}

install_homebrew() {
	info "Installing Homebrew..."
	export HOMEBREW_CASK_OPTS="--appdir=/Applications"
	if hash brew &>/dev/null; then
		warning "Homebrew already installed"
	else
		sudo --validate
		NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	fi
}

info "Dotfiles intallation initialized..."

info "================================================================================"
info "Prerequisities"
info "================================================================================"
install_xcode
install_homebrew
#
# echo "Installing Homebrew..."
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#
# echo "Installing Oh My Zsh..."
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
# echo "Installing PowerLevel10k Theme for Oh My Zsh..."
# git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
#
# echo "Installing plugin manager for tmux..."
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#
# echo "Installing ColorLS..."
# sudo gem install colorls
#
# # Prompt the user for input
# read -p "Overwrite existing dotfiles? [y/n] " choice
# chmod +x symlinks.sh
# if [[ "$choice" == "y" ]]; then
# 	echo "Deleting existing dotfiles..."
# 	./symlinks.sh --delete --include-files
# fi
# echo "Creating symbolic links..."
# ./symlinks.sh --create
#
# echo "Installing packages via Homebrew..."
# brew bundle install
#
# echo "Installing VSCode extensions..."
# chmod +x ./vscode/install-extensions.sh
# ./vscode/install-extensions.sh
#
# echo "Adding .hushlogin file to suppress 'last login' message in terminal..."
# touch ~/.hushlogin
#
# echo "Applying system configuration..."
# chmod +x ./system/apply-system-config.sh
# ./system/apply-system-config.sh
