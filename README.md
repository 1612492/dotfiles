# My dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's included

- **Neovim** - Configuration with lazy.nvim, LSP, and plugins
- **Kitty** - Terminal emulator config
- **Tmux** - Terminal multiplexer with TPM plugins
- **Zsh** - Shell config with Oh My Zsh
- **Mise** - Tool version manager for Node, Go, Rust, Bun, and pnpm
- **Homebrew** - Package manager with essential CLI tools and applications

## Installation

```bash
git clone https://github.com/1612492/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The install script will:

1. Install Homebrew (if not installed)
2. Install packages from Brewfile
3. Install Oh My Zsh
4. Install Zsh plugins (autosuggestions, syntax-highlighting)
5. Stow dotfiles to home directory
6. Install mise tools
7. Install TPM and tmux plugins

## Manual steps after installation

1. Restart your shell or run `source ~/.zshrc`

## Updating

To re-stow dotfiles after making changes:

```bash
cd ~/dotfiles
stow -R .
```

To update mise-managed tools:

```bash
mise upgrade
```
