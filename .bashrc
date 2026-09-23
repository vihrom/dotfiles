# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend
if [[ ! "$PROMPT_COMMAND" =~ "history -a" ]]; then
    PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
fi

# Env
export PATH="$HOME/.local/bin:$PATH"
export EDITOR='vim'

export NNN_PLUG='p:preview-tui;m:nmount;'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PREVIEWIMGPROG=ueberzug
export NNN_TERMINAL=st

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

# Autocd
shopt -s autocd

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Prompt
PS1='\[\e[1;34m\]\w\[\e[0m\] \$ '
