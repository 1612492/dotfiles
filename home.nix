{
  config,
  lib,
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
    prefix = "C-a";
    mouse = true;
    keyMode = "vi";
    terminal = "screen-256color";
    escapeTime = 0;
    focusEvents = true;
    plugins = with pkgs.tmuxPlugins; [
      resurrect
      continuum
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
      bind r source-file ~/.config/tmux/tmux.conf \; display-message 'Tmux configuration reloaded!'

      set -g @resurrect-dir '~/.tmux/sessions'
      set -g @continuum-restore 'on'

      set -g status-left '''
      set -g status-right '''
    '';
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nixfmt-rfc-style
      prettierd
      stylua
      tailwindcss-language-server
      tree-sitter
      vscode-langservers-extracted
      vscode-solidity-server
      vtsls
    ];
  };

  home.file = {
    ".config/nvim" = {
      source = ./nvim;
      recursive = true;
    };
    ".config/kitty" = {
      source = ./kitty;
      recursive = true;
    };
  };

  programs.home-manager.enable = true;
}
