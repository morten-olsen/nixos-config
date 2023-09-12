{ config, pkgs, ... }:

{
  boot.plymouth = {
    enable = true;
  };

  location = {
    provider = "geoclue2";
  };

  programs.dconf.enable = true;

  # broken due to geoclue being stupid
  #services.localtime.enable = true;

  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      corefonts
      source-code-pro
      source-sans-pro
      source-serif-pro
      dejavu_fonts
      iosevka-bin
    ];
  };

  services.xserver = {
    enable = true;
    #layout = "da";
    desktopManager.plasma5.enable = true;
    displayManager = {
      defaultSession = "plasmawayland";
      sddm = {
        enable = true;
        #enableHidpi = true;
      };
    };
  };

  environment.systemPackages = [ 
    pkgs.numix-icon-theme
    pkgs.papirus-icon-theme
    pkgs.arc-icon-theme
    #pkgs.plasma5Packages.kdeconnect-kde
    # this doesn't do much, but makes it easier to see the settings
    pkgs.sddm-kcm
  ];
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
}
