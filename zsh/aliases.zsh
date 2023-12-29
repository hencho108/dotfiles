# System
alias shutdown='sudo shutdown now'
alias restart='sudo reboot'
alias suspend='sudo pm-suspend'
alias sleep='pmset sleepnow'
alias c='clear'
alias e='exit'

# Git
alias g='git'
alias ga='git add'
alias gf='git fetch'
alias gs='git status'
alias gss='git status -s'
alias gb='git branch'
alias gup='git fetch && git rebase'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias gr='git branch -r'
alias glo='git pull origin'
alias gl='git pull'
alias gb='git branch '
alias gd='git diff'
alias gco='git checkout '
alias gcob='git checkout -b '
alias gr='git remote'
alias grs='git remote show'
alias glgg='git log --graph --max-count=5 --decorate --pretty="oneline"'
alias gm='git merge'
alias gp='git push'
alias gpo='git push origin'
alias ggpush='git push origin $(current_branch)'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gcmnv='git commit --no-verify -m'
# Git commit with ticket ID from current branch
alias gcmt='''
    branch_name=$(git branch --show-current);
    ticket_id=$(echo "$branch_name" | awk -F "-" "{print toupper(\$1\"-\"\$2)}");
    echo -n "Enter commit message ==> $ticket_id: " && \
        read commit_message && \
        git commit -m "$ticket_id: $commit_message"
    '''
quick_commit_push_with_ticket_id() {
  local branch_name ticket_id commit_message
  branch_name=$(git branch --show-current)
  ticket_id=$(echo "$branch_name" | awk -F '-' '{print toupper($1"-"$2)}')
  commit_message="$ticket_id: $*"
  git commit --no-verify -m "$commit_message" && git push
}
alias gqcp='quick_commit_push_with_ticket_id'

# Neovim
alias vim='nvim'
alias vi='nvim'

# Folders
alias doc="$HOME/Documents"
alias dow="$HOME/Downloads"
