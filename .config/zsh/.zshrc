ZSH_THEME="robbyrussell"
plugins=(
  asdf
  vi-mode
  tmux
  zsh-autosuggestions
)

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_CONFIG=$HOME/.config/tmux/tmux.conf

alias v='nvim'

source $ZSH/oh-my-zsh.sh
