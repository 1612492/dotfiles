#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Homebrew
install_homebrew() {
    if command_exists brew; then
        print_status "Homebrew is already installed"
    else
        print_warning "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Add Homebrew to PATH for this session
        if [[ -f "/opt/homebrew/bin/brew" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [[ -f "/usr/local/bin/brew" ]]; then
            eval "$(/usr/local/bin/brew shellenv)"
        fi
        print_status "Homebrew installed"
    fi
}

# Install brew packages from Brewfile
install_brew_packages() {
    if [ -f "$DOTFILES_DIR/Brewfile" ]; then
        print_warning "Installing brew packages from Brewfile..."
        brew bundle --file="$DOTFILES_DIR/Brewfile"
        print_status "Brew packages installed"
    else
        print_error "Brewfile not found at $DOTFILES_DIR/Brewfile"
        exit 1
    fi
}

# Install Oh My Zsh
install_oh_my_zsh() {
    if [ -d "$HOME/.oh-my-zsh" ]; then
        print_status "Oh My Zsh is already installed"
    else
        print_warning "Installing Oh My Zsh..."
        git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
        print_status "Oh My Zsh installed"
    fi
}

# Install Zsh plugins
install_zsh_plugins() {
    local plugins_dir="$HOME/.oh-my-zsh/custom/plugins"

    # zsh-autosuggestions
    if [ -d "$plugins_dir/zsh-autosuggestions" ]; then
        print_status "zsh-autosuggestions is already installed"
    else
        print_warning "Installing zsh-autosuggestions..."
        git clone https://github.com/zsh-users/zsh-autosuggestions "$plugins_dir/zsh-autosuggestions"
        print_status "zsh-autosuggestions installed"
    fi

    # zsh-syntax-highlighting
    if [ -d "$plugins_dir/zsh-syntax-highlighting" ]; then
        print_status "zsh-syntax-highlighting is already installed"
    else
        print_warning "Installing zsh-syntax-highlighting..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting "$plugins_dir/zsh-syntax-highlighting"
        print_status "zsh-syntax-highlighting installed"
    fi
}

# Install Tmux Plugin Manager and plugins
install_tpm() {
    if [ -d "$HOME/.tmux/plugins/tpm" ]; then
        print_status "Tmux Plugin Manager is already installed"
    else
        print_warning "Installing Tmux Plugin Manager..."
        git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
        print_status "Tmux Plugin Manager installed"
    fi

    # Install tmux plugins
    print_warning "Installing tmux plugins..."
    tmux source-file "$HOME/.tmux.conf"
    "$HOME/.tmux/plugins/tpm/bin/install_plugins"
    print_status "Tmux plugins installed"
}

# Stow dotfiles
stow_dotfiles() {
    print_warning "Stowing dotfiles..."
    cd "$DOTFILES_DIR"
    stow config -t "$HOME"
    print_status "Dotfiles stowed"
}

# Main installation
main() {
    echo "================================"
    echo "  Dotfiles Installation Script  "
    echo "================================"
    echo ""

    install_homebrew
    install_brew_packages
    install_oh_my_zsh
    install_zsh_plugins
    stow_dotfiles
    install_tpm

    echo ""
    echo "================================"
    print_status "Installation complete!"
    echo "================================"
    echo ""
    echo "Next steps:"
    echo "  1. Restart your shell or run: source ~/.zshrc"
    echo ""
}

main
