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
alias c='clear'


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


# Fzf
source <(fzf --zsh)


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
