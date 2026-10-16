# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY

# Options
setopt autocd
setopt CORRECT

# Aliases
alias ls='ls --color=auto'
alias g='git'
alias gst='git status'
alias c='clear'
alias d='dirs -v'
alias b='cd -'

# Env
typeset -U path PATH # This tells Zsh to automatically remove duplicate entries from $PATH

export PATH="$HOME/.local/bin:$PATH"
export EDITOR="vim"
export LIBVA_DRIVER_NAME=i965

export NNN_PLUG='p:preview-tui;m:nmount;i:imgview;'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PREVIEWIMGPROG=ueberzug
export NNN_TERMINAL=st

bindkey -e

# Completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Fzf
. ~/.local/share/fzf_init.zsh

# Prompt
eval "$(weakline init zsh)"
