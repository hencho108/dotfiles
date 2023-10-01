#!/bin/bash

. scripts/utils.sh
. scripts/prerequisites.sh
. scripts/osx-defaults.sh
. scripts/mac-apps.sh
. scripts/oh-my-zsh.sh
. scripts/colorls.sh
. scripts/symlinks.sh

info "Dotfiles intallation initialized..."
read -p "Overwrite existing dotfiles? [y/n] " overwrite_dotfiles

info "================================================================================"
info "Prerequisites"
info "================================================================================"

install_xcode
install_homebrew

info "================================================================================"
info "OSX System Defaults"
info "================================================================================"

register_keyboard_shortcuts
apply_osx_system_defaults

info "================================================================================"
info "Apps"
info "================================================================================"

install_brewfile_apps

info "================================================================================"
info "Terminal"
info "================================================================================"

install_oh_my_zsh
install_p10k
install_colorls
info "Adding .hushlogin file to suppress 'last login' message in terminal..."
touch ~/.hushlogin

info "================================================================================"
info "Symbolic Links"
info "================================================================================"

chmod +x ./scripts/symlinks.sh
if [[ "$overwrite_dotfiles" == "y" ]]; then
    warning "Deleting existing dotfiles..."
    ./scripts/symlinks.sh --delete --include-files
fi
./scripts/symlinks.sh --create

success "Dotfiles set up successfully."
