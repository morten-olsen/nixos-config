{ config, pkgs, ... }:

{
  imports = [
    ../tmux
    ../ssh
    ../git
    ../neovim
  ];
  home.packages = [
    pkgs.eza
    pkgs.bat
    pkgs.fzf
    pkgs.fd
    pkgs.curl
    pkgs.jq
    pkgs.rustup
    pkgs.bitwarden-cli
    pkgs.silver-searcher
    pkgs.ripgrep
    pkgs.thefuck
    pkgs.unzip
    pkgs.nodejs
    pkgs.gnumake
    pkgs.gcc
    pkgs.nodePackages.pnpm
    pkgs.nodePackages.yarn
    pkgs.nodePackages.yo
    pkgs.python3
    pkgs.gh
    pkgs.binutils
    pkgs.pkg-config
  ];

  programs.zsh.enable = true;
  home.file = {
    ".env".source = ./files/env;
    ".zshrc".source = ./files/zshrc;
    ".bashrc".source = ./files/bashrc;
    ".shellrc/rc.d" = {
      source = ./files/shell/rc.d;
    };
    ".oh-my-zsh" = {
      source = builtins.fetchGit {
        url = "https://github.com/ohmyzsh/ohmyzsh";
        rev = "b07c8cfe692bc6c7702f0aef5d493b12dfb43392";
      };
    };
    ".config/zsh/custom/plugins/zsh-autosuggestions" = {
      source = builtins.fetchGit {
        url = "https://github.com/zsh-users/zsh-autosuggestions";
        rev = "c3d4e576c9c86eac62884bd47c01f6faed043fc5";
      };
    };
    ".config/zsh/custom/plugins/zsh-syntax-highlighting" = {
      source = builtins.fetchGit {
        url = "https://github.com/zsh-users/zsh-syntax-highlighting";
        rev = "143b25eb98aa3227af63bd7f04413e1b3e7888ec";
      };
    };

    ".config/zsh/custom/zsh-vi-mode" = {
      source = builtins.fetchGit {
        url = "https://github.com/jeffreytse/zsh-vi-mode";
        rev = "1f28e1886dc8e49f41b817634d5c7695b6abb145";
      };
    };
  };
}
