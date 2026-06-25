# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000                 
SAVEHIST=5000

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
alias pacman-clean='pacman -Qtdq > /dev/null && sudo pacman -Rns $(pacman -Qtdq) || echo "No orphan packages found."'

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

# Theme
setopt prompt_subst

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats 'on %F{magenta} %b%f'

PROMPT='
%F{cyan}%~%f ${vcs_info_msg_0_}
%F{green}$%f '
