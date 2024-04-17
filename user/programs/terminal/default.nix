{ config, pkgs, ... }:

{
  imports = [
    ../fzf
    ../direnv
    ../gh
    ../tmux
    ../ssh
    ../git
    ../neovim
    ../bat
  ];
  home.packages = [
    pkgs.eza
    pkgs.zoxide
    pkgs.sd
    pkgs.tldr
    pkgs.choose
    pkgs.fd
    pkgs.curl
    pkgs.silver-searcher
    pkgs.ripgrep
    pkgs.thefuck
    pkgs.unzip
    pkgs.nodejs
    pkgs.gnumake
    pkgs.atuin
    pkgs.gcc
    pkgs.nodePackages.pnpm
    pkgs.nodePackages.yarn
    pkgs.nodePackages.yo
    pkgs.python3
    pkgs.binutils
    pkgs.pkg-config
    pkgs.marksman
    pkgs.duf
    pkgs.dust
    pkgs.rustscan
    pkgs.zoxide
  ];

  programs = {
    jq.enable = true;
    zsh.enable = true;
    yt-dlp.enable = true;
    starship = {
      enable = true;
    };
  };

  home.file = {
    ".env".source = ./files/env;
    ".zshrc".source = ./files/zshrc;
    ".bashrc".source = ./files/bashrc;
    # ".npmrc".source = ./files/npmrc;
    ".shellrc/rc.d" = {
      source = ./files/shell/rc.d;
    };
  };
}
