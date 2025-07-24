# My dotfiles

Install nix use determinate installer
```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Install nix-darwin
```
cd dotfiles
sudo nix run nix-darwin -- switch --flake .
```

Rebuild
```
sudo darwin-rebuild switch --flake .
```

Uninstall nix-darwin
```
sudo nix --extra-experimental-features "nix-command flakes" run nix-darwin#darwin-uninstaller
```

Uninstall nix
```
/nix/nix-installer uninstall
```

Clone ssh config

```
cp config.example ~/.ssh/config
```

Create ssh key
```
ssh-keygen -t ed25519
```
