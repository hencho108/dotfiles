#!/bin/bash

# Get the absolute path of the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

. $SCRIPT_DIR/utils.sh

install_vscode_extensions() {
    info "Installing VSCode extensions..."

    # List of Extensions
    extensions=(
        zhuangtongfa.Material-theme
        vscodevim.vim
        ms-python.python
        ms-toolsai.jupyter
        ms-python.isort
        ms-python.black-formatter
        ms-python.flake8
        vscode-icons-team.vscode-icons
        ms-azuretools.vscode-docker
        mtxr.sqltools
        ZainChen.json
        redhat.vscode-yaml
        eamodio.gitlens
        mechatroner.rainbow-csv
        esbenp.prettier-vscode
    )

    for e in "${extensions[@]}"; do
        code --install-extension "$e"
    done

    success "VSCode extensions installed successfully"
}

if [ "$(basename "$0")" = "$(basename "${BASH_SOURCE[0]}")" ]; then
    install_vscode_extensions
fi
