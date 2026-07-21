# My dotfiles

Personal macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's included

- **Aerospace** - package dir `aerospace/` stows `.config/aerospace/` into `~/.config/aerospace/`
- **Kitty** - package dir `kitty/` stows `.config/kitty/` into `~/.config/kitty/`
- **Mise** - package dir `mise/` stows `.config/mise/` into `~/.config/mise/`
- **Neovim** - package dir `nvim/` stows `.config/nvim/` into `~/.config/nvim/`
- **Opencode** - package dir `opencode/` stows `.config/opencode/` into `~/.config/opencode/`
- **Tmux** - package dir `tmux/` stows `.tmux.conf` into `~/.tmux.conf`
- **Zsh** - package dir `zsh/` stows `.zshrc` into `~/.zshrc` with `mise`, `vi-mode`, `zoxide`, autosuggestions, and syntax highlighting
- **Homebrew** - Packages and apps defined in `Brewfile`

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
5. Stow package dirs into your home directory with GNU Stow
6. Install `mise` tools from `mise/.config/mise/config.toml` if `mise` is available
7. Install TPM and tmux plugins

## Manual steps after installation

1. Restart your shell or run `source ~/.zshrc`
2. Restart tmux if it was already running so the updated config is reloaded

## Updating

To re-stow dotfiles after making changes:

```bash
cd ~/dotfiles
stow -t "$HOME" aerospace kitty mise nvim opencode tmux zsh
```

To update mise-managed tools:

```bash
mise upgrade
```

To refresh Homebrew packages and apps from `Brewfile`:

```bash
brew bundle --file ~/dotfiles/Brewfile
```
