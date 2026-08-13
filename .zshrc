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
eval "$(weakline init zsh)"
