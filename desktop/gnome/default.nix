{ config, pkgs, ... }:

{
  boot.plymouth = {
    enable = true;
  };

  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];

      displayManager.gdm.enable = true;
      desktopManager.gnome = {
        enable = true;
      };

      xkb = {
        layout = "dk";
        variant = "";
        options = "caps:swapescape";
      };
    };

    udev = {
      packages = [
        pkgs.gnome.gnome-settings-daemon
      ];
    };

    gnome = {
      gnome-browser-connector.enable = false;
      gnome-initial-setup.enable = false;
      gnome-online-accounts.enable = false;
    };

    printing = {
      enable = true;
    };
  };


  programs.dconf.enable = true;

  environment = {
    systemPackages = [
      #pkgs.gnome.dconf-editor
      pkgs.gnome.networkmanager-openconnect
      pkgs.numix-icon-theme
      pkgs.papirus-icon-theme
      pkgs.arc-icon-theme
      pkgs.wl-clipboard
      pkgs.gnome.gnome-tweaks
    ] ++ [
      #pkgs.alacritty # pkgs.gnome-console
      #pkgs.firefox # pkgs.gnome.epiphany
    ];

    sessionVariables.NIXOS_OZONE_WL = "1";

    gnome.excludePackages = [
      pkgs.gnome-connections
      pkgs.gnome-console
      pkgs.gnome-text-editor
      pkgs.gnome-tour
      # pkgs.gnome.adwaita-icon-theme
      pkgs.gnome.epiphany
      pkgs.gnome.evince
      pkgs.gnome.file-roller
      pkgs.gnome.geary
      pkgs.gnome.gnome-backgrounds
      # pkgs.gnome.gnome-calendar
      pkgs.gnome.gnome-characters
      # pkgs.gnome.gnome-clocks
      pkgs.gnome.gnome-contacts
      pkgs.gnome.gnome-font-viewer
      pkgs.gnome.gnome-logs
      pkgs.gnome.gnome-maps
      pkgs.gnome.gnome-music
      # pkgs.gnome.gnome-themes-extra
      pkgs.gnome.gnome-weather
      # pkgs.gnome.nautilus
      pkgs.gnome.simple-scan
      pkgs.gnome.sushi
      pkgs.gnome.totem
      pkgs.gnome.yelp
      pkgs.orca
    ];
  };

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
      ubuntu_font_family
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ];
    enableDefaultPackages = true;
    fontconfig = {
      defaultFonts = {
        serif = [ "Ubuntu" ];
        sansSerif = [ "Ubuntu" ];
        monospace = [ "Ubuntu" ];
      };
    };
    fontDir.enable = true;
  };

}
