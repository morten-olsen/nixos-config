{ config, pkgs, ... }:

{
  imports = [
    ./locales.nix
    ./nix.nix
    ./network.nix
    ./security.nix
    ./udev.nix
  ];
  environment.systemPackages = [
    pkgs.nfs-utils
  ];

  services = {
    fwupd.enable = true;

    # override nixos-hardware profile
    throttled.enable = false;
    thermald.enable = true;
  };
}

