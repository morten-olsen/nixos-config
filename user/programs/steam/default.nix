{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.steam-run,
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  nixpkgs = {
    overlays = [
      (import ./overlays/steam.nix)
    ];
  };
}
