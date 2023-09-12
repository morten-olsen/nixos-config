{ config, pkgs, ... }:

{
  imports = [
    ./environment.nix
  ];
  environment.systemPackages = [
    pkgs.hyprland
    pkgs.eww
    pkgs.wofi
    pkgs.swaylock-effects
    pkgs.swayidle
  ];

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
