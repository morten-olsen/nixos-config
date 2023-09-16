{ config, pkgs, ... }:

{
  imports = [
    ../kitty
  ];
  home.packages = [
    pkgs.wl-clipboard
  ];

  home.file = {
    ".config/hypr" = {
      source = ./files/hypr;
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
  };
}
