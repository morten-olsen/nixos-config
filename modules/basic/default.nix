{ config, pkgs, ... }:

{
  imports = [
    ./locales.nix
    ./nix.nix
    ./network.nix
    ./security.nix
    ./udev.nix
  ];

   environment.systemPackages = with pkgs; [
     linuxPackages.v4l2loopback
   ];

  boot.kernelModules = [ "v4l2loopback" ];

  services = {
    fwupd.enable = true;

    # override nixos-hardware profile
    throttled.enable = false;
    thermald.enable = true;
  };
}

