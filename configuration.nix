{
  self,
  pkgs,
  whoami,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  fonts.packages = with pkgs; [
    victor-mono
  ];

  nix.settings.experimental-features = "nix-command flakes";
  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.primaryUser = whoami;
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  users.users.${whoami} = {
    name = whoami;
    home = "/Users/${whoami}";
  };

  homebrew = {
    enable = true;
    casks = [
      "cloudflare-warp"
      "dbeaver-community"
      "google-chrome"
      "kitty"
      "maccy"
      "orbstack"
      "postman"
      "redis-insight"
    ];
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
  };

  system.defaults.dock = {
    persistent-apps = [
      "/System/Applications/System Settings.app"
      "/System/Applications/Calendar.app"
      "/System/Applications/Notes.app"
      "/Applications/Google Chrome.app"
      "/Applications/kitty.app"
      "/Applications/OrbStack.app"
      "/Applications/DBeaver.app"
      "/Applications/Postman.app"
    ];
    autohide = true;
    show-recents = false;
  };
}
