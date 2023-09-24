#!/bin/bash

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
