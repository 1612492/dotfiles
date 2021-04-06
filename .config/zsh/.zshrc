export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(
    git
    vi-mode
    zsh-autosuggestions
)

alias t='tmux'
alias v='nvim'
alias tx='tmuxinator start'
alias dj='tx ts dj_web'

source $ZSH/oh-my-zsh.sh
