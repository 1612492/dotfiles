export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim
export CARGO_HOME=$HOME/.cargo
export CARGO_INSTALL_ROOT=$HOME/.asdf/installs/rust/stable
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$CARGO_INSTALL_ROOT/bin

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
