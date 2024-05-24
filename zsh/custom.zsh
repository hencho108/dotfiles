# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Themes (onedark or nord)
export TMUX_THEME="nord"
export NVIM_THEME="nord"
export STARSHIP_THEME="nord"

# Pipenv
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export PIPENV_VENV_IN_PROJECT=1

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)" # Initialize pyenv when a new shell spawns

# Poetry
export PATH="$HOME/.local/bin:$PATH"
# alias poetry_shell='. "$(dirname $(poetry run which python))/activate"'

# zettl
export Z_EDITOR='nvim'
export NOTE_NAME_AS_TITLE=1
export NOTES_DIR="$HOME/Dropbox/zettl"

# Use neovim as default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Add /usr/local/bin to the beginning of the PATH environment variable.
# This ensures that executables in /usr/local/bin are found before other directories in the PATH.
export PATH="/usr/local/bin:$PATH"

# Set LDFLAGS environment variable for the linker to use the specified directories for library files.
# This is useful when building software that depends on non-standard library locations, like zlib and bzip2 in this case.
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"

# Set CPPFLAGS environment variable for the C/C++ preprocessor to use the specified directories for header files.
# This is useful when building software that depends on non-standard header locations, like zlib and bzip2 in this case.
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# Hide computer name in terminal
export DEFAULT_USER="$(whoami)"

# Load Git completion
zstyle ':completion:*:*:git:*' script $HOME/.config/zsh/git-completion.bash
fpath=($HOME/.config/zsh $fpath)
autoload -Uz compinit && compinit

# fzf
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_DEFAULT_COMMAND='rg --hidden -l ""' # Include hidden files

bindkey "ç" fzf-cd-widget # Fix for ALT+C on Mac

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# Tmux
# Always work in a tmux session if Tmux is installed
if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach -t default || tmux new -s default; exit
  fi
fi

# Redshift
export ODBCINI="$HOME/.odbc.ini"
export ODBCSYSINI="/opt/amazon/redshift/Setup"
export AMAZONREDSHIFTODBCINI="/opt/amazon/redshift/lib/amazon.redshiftodbc.ini"
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/usr/local/lib"

# Activate syntax highlighting
# source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Activate autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Vi mode
# ANSI cursor escape codes:
# \e[0 q: Reset to the default cursor style.
# \e[1 q: Blinking block cursor.
# \e[2 q: Steady block cursor (non-blinking).
# \e[3 q: Blinking underline cursor.
# \e[4 q: Steady underline cursor (non-blinking).
# \e[5 q: Blinking bar cursor.
# \e[6 q: Steady bar cursor (non-blinking).
bindkey -v
export KEYTIMEOUT=1 # Makes switching modes quicker
export VI_MODE_SET_CURSOR=true 

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne '\e[1 q' # block
  else
    echo -ne '\e[5 q' # beam
  fi
}
zle -N zle-keymap-select
zle-line-init() {
  zle -K viins # initiate 'vi insert' as keymap (can be removed if 'binkey -V has been set elsewhere')
  echo -ne '\e[5 q'
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup

# Yank to the system clipboard
function vi-yank-xclip {
  zle vi-yank
  echo "$CUTBUFFER" | pbcopy -i
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip
