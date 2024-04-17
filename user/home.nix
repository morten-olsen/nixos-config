{ config, pkgs, lib,... }:

{
  home.username = "alice";
  home.homeDirectory = "/home/alice";

  imports = [
    ./dconf.nix
    ./programs/terminal
    ./programs/kitty
    ./programs/firefox
    ./programs/devbox
    #./programs/vscode
  ];

  home.file = {
    ".wallpaper.jpg".source = ./wallpaper.jpg; 
  };

  home.stateVersion = "23.11";
  home.packages = with pkgs; [
    signal-desktop
    gnomeExtensions.user-themes
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.vitals
    gnomeExtensions.dash-to-panel
    gnomeExtensions.sound-output-device-chooser
    gnomeExtensions.space-bar

  ];


  home.sessionVariables = {};

  programs.home-manager.enable = true;

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "trayIconsReloaded@selfmade.pl"
        # "Vitals@CoreCoding.com"
        "dash-to-panel@jderose9.github.com"
        "sound-output-device-chooser@kgshank.net"
        "space-bar@luchrioh"

      ];
    };
  };


  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Orchis-Dark";
      package = pkgs.orchis;
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

  };

}
