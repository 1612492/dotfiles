# Setup on new Window

- Install [WSL](https://docs.microsoft.com/en-us/windows/wsl/install)
- Edit wsl setting.json file (to avoid conflict ctrl + v mapping, add terminal themes)
- Clone `.config/` and `.zshenv` to `$HOME`
- Use `ssh-keygen` to generate ssh key
- Config ssh to access multi github accounts in `.ssh/config`
```
Host me.github.com
    HostName github.com
    IdentityFile ~/.ssh/other_id_rsa
```
- Install neovim, tmux plugins
- Use windows clipboard in neovim with [win32yank](https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl)
