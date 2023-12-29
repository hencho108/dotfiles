# zsh Options
setopt HIST_IGNORE_ALL_DUPS

# Custom zsh
[ -f "$HOME/.config/zsh/custom.zsh" ] && source "$HOME/.config/zsh/custom.zsh"

# Aliases
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"

# Work
[ -f "$HOME/.config/zsh/work.zsh" ] && source "$HOME/.config/zsh/work.zsh"

# Secrets
[ -f "$HOME/.env" ] && source "$HOME/.env"

# Initialize Oh My Zsh or Starsihp (Pick one!)
# source "$HOME/.config/zsh/oh-my-zsh-setup.zsh"
source "$HOME/.config/zsh/starship-setup.zsh"
