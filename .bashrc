# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias c='clear'

# Completions
bind "set completion-ignore-case on"

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

bind "set show-all-if-ambiguous on"
bind "TAB:menu-complete"

shopt -s autocd

# Fzf
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Prompt
PS1='\[\e[1;34m\]\w\[\e[0m\] \$ '
. "$HOME/.cargo/env"
