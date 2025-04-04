ZSH_THEME="robbyrussell"
plugins=(
  vi-mode
  zsh-autosuggestions
)

alias v='nvim'

export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
