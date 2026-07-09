# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000                 
SAVEHIST=10000

setopt EXTENDED_HISTORY          
setopt HIST_IGNORE_ALL_DUPS 
setopt HIST_IGNORE_SPACE        
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY


# Options
setopt autocd
setopt CORRECT


# Alias
alias ls='ls --color=auto'


# Env
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="vim"
export LIBVA_DRIVER_NAME=i965

bindkey -e


# Completions 
autoload -Uz compinit && compinit


# Autosuggestions 
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# Interactive menu
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


# Fzy History
fzy-history-search() {
  local selected
  selected=$(fc -r -l -n 1 | awk '!seen[$0]++' | fzy --query="$BUFFER" 2>/dev/null)
  
  if [ -n "$selected" ]; then
    BUFFER="$selected"
    CURSOR=$#BUFFER
  fi
  zle reset-prompt
}

zle -N fzy-history-search
bindkey '^R' fzy-history-search


# Fzy File
fzy-file-widget() {
    local selected
    selected=$(find . -type f 2> /dev/null | fzy)

    if [ -n "$selected" ]; then
        LBUFFER="${LBUFFER}${(q)selected}"
    fi
    zle reset-prompt
}

zle -N fzy-file-widget
bindkey '^T' fzy-file-widget


# Fzy Directory
fzy-cd-widget() {
    local selected
    selected=$(find . -mindepth 1 -type d 2> /dev/null | fzy)
    
    if [ -n "$selected" ]; then
        cd "$selected"
    fi
    zle reset-prompt
}

zle -N fzy-cd-widget
bindkey '^[c' fzy-cd-widget


# Theme
setopt prompt_subst

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{yellow}*%f'
zstyle ':vcs_info:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:git:*' formats 'on %F{magenta} %b%u%c%f'
zstyle ':vcs_info:git+post-backend:*' hooks git-post-backend-updown

+vi-git-post-backend-updown() {
    git rev-parse @{upstream} >/dev/null 2>&1 || return 0
    local -a x
    x=( $(git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null) )
    
    (( x[1] )) && hook_com[branch]+="%F{green}↑%f"
    (( x[2] )) && hook_com[branch]+="%F{red}↓%f"
    return 0
}

PROMPT='
%F{cyan}%~%f ${vcs_info_msg_0_}
%F{green}$%f '

