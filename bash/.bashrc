# .bashrc
# Minimal configuration for bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=10000
HISTFILESIZE=10000

shopt -s histappend
PROMPT_COMMAND="history -a; history -n"

# Env
export PATH="$HOME/.local/bin:$PATH"
export EDITOR='vim'

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias c='clear'
alias b='cd -'

# Completions
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
bind "TAB:menu-complete"

# Arrows history search
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Autocd
shopt -s autocd

# Prompt
PS1='\[\e[1;34m\]\w\[\e[0m\] \$ '
