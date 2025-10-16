{
  config,
  pkgs,
  whoami,
  ...
}:

{
  home.username = whoami;
  home.homeDirectory = "/Users/${whoami}";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    bottom
    bun
    claude-code
    fd
    fzf
    ngrok
    nodejs_22
    pnpm
    ripgrep
  ];

  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "vi-mode" ];
    };
    shellAliases = {
      v = "nvim";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
    shortcut = "a";
    mouse = true;
    keyMode = "vi";
    terminal = "screen-256color";
    escapeTime = 0;
    focusEvents = true;
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-dir '~/.tmux/sessions'";
      }
      {
        plugin = continuum;
        extraConfig = "set -g @continuum-restore 'on'";
      }
      yank
      catppuccin
    ];
    extraConfig = ''
      bind -T copy-mode-vi 'v' send -X begin-selection
      bind -T copy-mode-vi 'r' send -X rectangle-toggle
      bind e split-window -h -c '#{pane_current_path}'
      bind v split-window -v -c '#{pane_current_path}'
      bind c new-window -c '#{pane_current_path}'
      bind -r -T prefix k select-pane -U
      bind -r -T prefix j select-pane -D
      bind -r -T prefix h select-pane -L
      bind -r -T prefix l select-pane -R
      set -g status-left '''
      set -g status-right '''
    '';
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      astro-language-server
      lua-language-server
      nixd
      nixfmt-rfc-style
      prettierd
      stylua
      tailwindcss-language-server
      tree-sitter
      vscode-langservers-extracted
      vtsls
    ];
  };

  xdg.configFile =
    let
      configPath = "${config.home.homeDirectory}/dotfiles";
    in
    {
      "nvim".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/nvim";
      "kitty".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/kitty";
    };

  programs.home-manager.enable = true;
}
