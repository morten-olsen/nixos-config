{ config, pkgs, lib,... }:

{
  home.username = "alice";
  home.homeDirectory = "/home/alice";

  imports = [
    ./dconf.nix
    ./programs/terminal
    ./programs/kitty
    ./programs/firefox
    #./programs/vscode
  ];

  home.file = {
    ".wallpaper.jpg".source = ./wallpaper.jpg; 
  };

  home.stateVersion = "23.11";
  home.packages = [
    pkgs.signal-desktop
  ];


  home.sessionVariables = {};

  programs.home-manager.enable = true;

}
