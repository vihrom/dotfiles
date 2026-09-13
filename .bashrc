# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# History
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend

# Exports
export EDITOR='vis'
export NNN_PLUG='p:preview-tui;m:nmount;'
export NNN_FIFO=/tmp/nnn.fifo

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias c='clear'

# Git Aliases
alias g='git'
alias gst='git status -sb'
alias glg='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)" --all'

alias gco='git checkout'
alias gcob='git checkout -b'
alias gbr='git branch --sort=-committerdate'

alias gcm='git commit -m'
alias gca='git commit -a -m'
alias gamend='git commit --amend --no-edit'
alias gsave='git add -A && git commit -m "WIP"'

alias gd='git diff'
alias gds='git diff --staged'
alias gadd='git add'
alias gpush='git push'
alias gup='git pull --rebase'

alias gunstage='git reset HEAD --'
alias guncommit='git reset --soft HEAD~1'

# Completions
bind "set completion-ignore-case on"

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

bind "set show-all-if-ambiguous on"
bind "TAB:menu-complete"

shopt -s autocd

# Fuzzy search command history
fzy-history-widget() {
  local selected_cmd=$(history | sort -nr | awk '{$1=""; print $0}' | sed 's/^[ \t]*//' | fzy --query="$READLINE_LINE")
  if [ -n "$selected_cmd" ]; then
    READLINE_LINE="$selected_cmd"
    READLINE_POINT=${#READLINE_LINE}
  fi
}
bind -x '"\C-r": fzy-history-widget'

# Fuzzy select a file path into the command line
fzy-file-widget() {
  local selected_file=$(find . -type f -not -path '*/.*' 2>/dev/null | fzy)
  if [ -n "$selected_file" ]; then
    READLINE_LINE="${READLINE_LINE:0:READLINE_POINT}$selected_file${READLINE_LINE:READLINE_POINT}"
    READLINE_POINT=$((READLINE_POINT + ${#selected_file}))
  fi
}
bind -x '"\C-t": fzy-file-widget'

# CD into a fuzzy-selected directory
fzy-cd-widget() {
  local selected_dir=$(find . -type d -not -path '*/.*' 2>/dev/null | fzy)
  if [ -n "$selected_dir" ]; then
    cd "$selected_dir" || return
    READLINE_LINE=""
    READLINE_POINT=0
  fi
}
bind -x '"\ec": fzy-cd-widget'

# Prompt
PS1='\[\e[1;34m\]\w\[\e[0m\] \$ '
