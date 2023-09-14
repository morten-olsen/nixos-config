{ config, pkgs, ... }:

let 
  astronvim = builtins.fetchGit {
    url = "https://github.com/AstroNvim/AstroNvim";
    rev = "dad0bec1fef2833561d04ea446a544fbfde92539";
  };
  astronvimUser = builtins.fetchGit {
    url = "https://foo:foo@github.com/morten-olsen/astrovim";
    rev = "44b38567fe3adedd972b5b07f5883d47600a9078";
  };
in {
  home.username = "alice";
  home.homeDirectory = "/home/alice";

  home.stateVersion = "23.11";
  home.packages = [
    pkgs.kitty
    pkgs.eza
    pkgs.bat
    pkgs.fzf
    pkgs.fd
    pkgs.curl
    pkgs.jq
    pkgs.spotify
    pkgs.slack
    pkgs.rustup
    pkgs.bitwarden
    pkgs.bitwarden-cli
    pkgs.silver-searcher
    pkgs.ncspot
    pkgs.ripgrep
    pkgs.thefuck
    pkgs.unzip
    pkgs.nodejs
    pkgs.gnumake
    pkgs.gcc
    pkgs.terraform
    pkgs.darktable
    pkgs.rawtherapee
    pkgs.signal-desktop
    pkgs.nodePackages.pnpm
    pkgs.nodePackages.yarn
    pkgs.nodePackages.yo
    pkgs.steam-run
    pkgs.python3
    pkgs.gimp
    pkgs.blender
    pkgs.gh
    pkgs.discord
    pkgs.binutils
    pkgs.pkg-config
  ];

  programs.firefox.enable = true;
  programs.zsh.enable = true;
  programs.neovim.enable = true;
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./files/tmux/config;
  };
  programs.git.enable = true;

  home.file = {
    ".gitconfig".source = ./files/git/config;
    ".tmux.conf".source = ./files/tmux/config;
    ".zshrc".source = ./files/zsh/config;
    ".bashrc".source = ./files/bash/config;

    ".shellrc/rc.d" = {
      source = ./files/shell/rc.d;
    };

    ".gnupg" = {
      source = ./files/gpg;
      recursive = true;
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
  
    ".config/ssh" = {
      source = ./files/ssh;
      recursive = true;
    };

    ".config/hypr" = {
      source = ./files/hyprland;
      recursive = true;
    };
    ".config/kitty" = {
      source = ./files/kitty;
      recursive = true;
    };
    ".config/eww" = {
      source = ./files/eww;
      recursive = true;
    };
    ".config/wofi" = {
      source = ./files/wofi;
      recursive = true;
    };
    ".config/nvim" = {
      source = astronvim;
      recursive = true;
    };
    ".config/nvim/lua/user" = {
      source = astronvimUser;
    };
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;

  nixpkgs = {
    overlays = [
      (import ./overlays/steam.nix)
    ];

  };


  systemd.user.services.protonmail-bridge = {
    Unit = {
      Description = "Protonmail Bridge";
      After = [ "network.target" ];
    };

    Service = {
      Restart = "always";
      ExecStart = "${pkgs.protonmail-bridge}/bin/protonmail-bridge --no-window --noninteractive";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
