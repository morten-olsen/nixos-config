{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome = {
    enable = true;
  };

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "dk";
      variant = "";
      options = "caps:swapescape";
    };
  };

  environment.systemPackages = [
    pkgs.wl-clipboard
  ];

  # Enable CUPS to print documents.
  # services.printing.enable = true;
  fonts = {
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
      ubuntu_font_family
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
