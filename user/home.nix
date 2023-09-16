{ config, pkgs, lib,... }:

{
  home.username = "alice";
  home.homeDirectory = "/home/alice";

  imports = [
    ./programs/terminal
    ./programs/kitty
    ./programs/firefox
  ];

  home.stateVersion = "23.11";
  home.packages = [
    pkgs.spotify
    pkgs.slack
    pkgs.darktable
    pkgs.rawtherapee
    pkgs.signal-desktop
    pkgs.gimp
    pkgs.blender
    pkgs.discord
  ];


  home.sessionVariables = {};

  programs.home-manager.enable = true;

}
