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
