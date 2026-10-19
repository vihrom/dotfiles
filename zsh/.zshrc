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

# Fzy integration
fzy-file-widget() {
    local selected
    selected=$(find . -type f -not -path '*/.git/*' 2>/dev/null | fzy)
    if [[ -n $selected ]]; then
        LBUFFER+=${(q)selected}
    fi
    zle redisplay
}
zle -N fzy-file-widget
bindkey '^T' fzy-file-widget

fzy-history-widget() {
    local selected
    selected=$(fc -rl 1 \
        | sed -E 's/^[[:space:]]*[0-9]+[[:space:]]+//' \
        | sed 's/\\n/ /g' \
        | awk '!seen[$0]++' \
        | fzy)
    if [[ -n $selected ]]; then
        BUFFER=$selected
        CURSOR=${#BUFFER}
    fi
    zle redisplay
}
zle -N fzy-history-widget
bindkey '^R' fzy-history-widget

fzy-cd-widget() {
    local selected
    selected=$(find . -type d -not -path '*/.git*' 2>/dev/null | fzy)
    if [[ -n $selected ]]; then
        cd -- "$selected" || return
    fi
    zle redisplay
}
zle -N fzy-cd-widget
bindkey '\ec' fzy-cd-widget

# Prompt
eval "$(weakline init zsh)"
