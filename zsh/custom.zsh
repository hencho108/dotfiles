# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Themes (onedark or nord)
export TMUX_THEME="onedark"
export NVIM_THEME="onedark"
export STARSHIP_THEME="onedark"

# Pipenv
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
# export PIPENV_VENV_IN_PROJECT=1

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

# ColorLS
# alias ls='colorls'
# alias lc='colorls -lA --sd'
# source $(dirname $(gem which colorls))/tab_complete.sh

# Tmux
# Always work in a tmux session if Tmux is installed
# if which tmux 2>&1 >/dev/null; then
#   if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
#     tmux attach -t default || tmux new -s default; exit
#   fi
# fi
