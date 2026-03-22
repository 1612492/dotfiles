# My dotfiles

Personal macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's included

- **Neovim** - lazy.nvim-based setup with modular config in `.config/nvim/`
- **Kitty** - Customized terminal config in `.config/kitty/kitty.conf`
- **Tmux** - `.tmux.conf` with TPM plugin management
- **Zsh** - Oh My Zsh setup in `.zshrc` with `mise`, `vi-mode`, `zoxide`, autosuggestions, and syntax highlighting
- **Mise** - Tool versions pinned in `.config/mise/config.toml` (`node@24`, latest `bun`, latest `pnpm`)
- **Aerospace** - Tiling window manager config in `.config/aerospace/aerospace.toml`
- **Opencode** - CLI config and plugin setup in `.config/opencode/`
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
5. Stow dotfiles into your home directory with GNU Stow
6. Install `mise` tools from `.config/mise/config.toml` if `mise` is available
7. Install TPM and tmux plugins

## Manual steps after installation

1. Restart your shell or run `source ~/.zshrc`
2. Restart tmux if it was already running so the updated config is reloaded

## Updating

To re-stow dotfiles after making changes:

```bash
cd ~/dotfiles
stow -R .
```

GNU Stow skips files listed in `.stow-local-ignore`, including `README.md`, `Brewfile`, and `install.sh`.

To update mise-managed tools:

```bash
mise upgrade
```

To refresh Homebrew packages and apps from `Brewfile`:

```bash
brew bundle --file ~/dotfiles/Brewfile
```
