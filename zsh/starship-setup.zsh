# Initialize config
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# Apply Starship theme
starship config palette $STARSHIP_THEME

