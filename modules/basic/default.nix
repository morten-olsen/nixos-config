{ config, pkgs, ... }:

{
  imports = [
    ./locales.nix
    ./nix.nix
    ./network.nix
    ./security.nix
  ];

  services = {
    fwupd.enable = true;

    # override nixos-hardware profile
    throttled.enable = false;
    thermald.enable = true;
  };
}

