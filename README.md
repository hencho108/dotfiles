# My dotfiles

## MacOS Setup

Install essential software.

### [Homebrew](https://brew.sh/) - Package manager for MacOS

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add Homebrew to PATH.

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/<username>/.zshrc
```

### [Brave Browser](https://formulae.brew.sh/cask/brave-browser) - Decent web browser

```bash
brew install --cask brave-browser
```

### [iTerm2](https://formulae.brew.sh/cask/iterm2) - Terminal emulator app

```bash
brew install --cask iterm2
```

### [Rectangle](https://formulae.brew.sh/cask/rectangle) - Move and resize windows using keyboard shortcuts

```bash
brew install --cask rectangle
```

### [Neovim](https://formulae.brew.sh/formula/neovim) - Vim text editor

```bash
brew install neovim
```

### [Node](https://formulae.brew.sh/formula/node) - node.js/npm

```bash
brew install node
```

### [ripgrep](https://formulae.brew.sh/formula/ripgrep) - Search tool like grep. Enables live grep for the Telescope Neovim plugin.

```bash
brew install ripgrep
```

### Hack Nerd Font

```bash
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
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

### Plugins for Oh My Zsh

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

### [tmux](https://formulae.brew.sh/formula/tmux) - Terminal multiplexer

```bash
brew install tmux
```

Plugin manager for tmux

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Enable key repeats globally. This will enable pressing and holding 'hjkl' in JupterLab's vim mode, for instance.

```
defaults write -g ApplePressAndHoldEnabled -bool false
```

## Inspired by

- [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)
- [craftzdog/dotfiles-public](https://github.com/craftzdog/dotfiles-public)
- [josean-dev/dev-environment-files](https://github.com/josean-dev/dev-environment-files)
