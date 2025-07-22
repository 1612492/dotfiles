{ config, pkgs, whoami, ... }:

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

  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      resurrect
      continuum
      yank
      catppuccin
    ];
    extraConfig = ''
      set -g prefix C-a
      set -g mouse on
      setw -g mode-keys vi
      set -g default-terminal "screen-256color"
      set -sg escape-time 0
      set -g focus-events on
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
      set -g @catppuccin_window_current_text ' #{b:pane_current_path}'
      set -g @catppuccin_window_text ' #{b:pane_current_path}'
      set -g @catppuccin_status_background 'none'

      set -g status-left '''
      set -g status-right '%Y-%m-%d %H:%M '
    '';
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.kitty = {
    enable = true;
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
