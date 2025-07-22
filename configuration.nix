{ self, config, pkgs, whoami, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    vim
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
  };
}
