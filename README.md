# My dotfiles

## MacOS Setup

Install essential software.

### [Homebrew](https://brew.sh/) - Package manager for MacOS

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add Homebrew to PATH.

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zshrc
```

Install apps from `Brewfile`.

```bash
brew bundle install
```

### Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### PowerLevel10K Theme for Oh My Zsh

```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

Modify the value of `ZSH_THEME` in `.zshrc`.

```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Configure PowerLevel10K.

```bash
p10k configure
```

### Plugins for Oh My Zsh (should already be installed via Brewfile)

Autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Syntax highlighting

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Modfiy the plugins line in `.zshrc`

```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting vi-mode)
```

### [ColorLS](https://github.com/athityakumar/colorls)

```bash
sudo gem install colorls
```

### Tmux plugins

Plugin manager for tmux

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Other

Enable key repeats globally. This will enable pressing and holding 'hjkl' in JupterLab's vim mode, for instance.

```
defaults write -g ApplePressAndHoldEnabled -bool false
```

## Inspired by

- [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)
- [craftzdog/dotfiles-public](https://github.com/craftzdog/dotfiles-public)
- [josean-dev/dev-environment-files](https://github.com/josean-dev/dev-environment-files)
