# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000                 
SAVEHIST=10000

setopt EXTENDED_HISTORY          
setopt HIST_IGNORE_ALL_DUPS 
setopt HIST_IGNORE_SPACE        
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY


setopt autocd
setopt CORRECT


alias ls='ls --color=auto'
alias pacman-clean='pacman -Qtdq > /dev/null && sudo pacman -Rns $(pacman -Qtdq) || echo "No orphan packages found."'


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Completions
zstyle ':completion:*' menu select

# Plugins
zinit wait"0" lucid light-mode for zsh-users/zsh-completions
zinit wait"0" lucid light-mode for zsh-users/zsh-autosuggestions
zinit wait"0" lucid light-mode atload"zicompinit; zicdreplay" for zsh-users/zsh-syntax-highlighting



# Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k


export EDITOR="vim"
bindkey -e

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
