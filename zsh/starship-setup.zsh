export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

eval "$(starship init zsh)"

# Apply Starship theme
starship config palette $STARSHIP_THEME

# Activate syntax highlighting
# source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Activate autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Vi mode
bindkey -v
export KEYTIMEOUT=1 # Makes switching modes quicker
export VI_MODE_SET_CURSOR=true 

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne '\e[1 q'
  else
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne '\e[5 q'
}
zle -N zle-line-init
echo -ne '\e[5 q'

