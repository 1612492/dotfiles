{ self, config, pkgs, whoami, ... }:

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
      "kitty"
      "maccy"
      "cloudflare-warp"
      "google-chrome"
      "orbstack"
      "pgadmin4"
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
      "/Applications/pgAdmin 4.app"
    ];
    autohide = true;
    show-recents = false;
  };
}
