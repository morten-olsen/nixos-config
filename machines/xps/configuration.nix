{ config, pkgs, nixos-hardware, home-manager, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      nixos-hardware.nixosModules.dell-xps-13-7390
      home-manager.nixosModules.home-manager
      ../../user
      ../../modules/gpu/intel
      ../../modules/basic
      ../../modules/audio
      ../../modules/samba
      ../../modules/laptop
      ../../modules/docker
      ../../modules/flatpak
      ../../desktop/gnome
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-20428df9-98ee-45a6-9dc1-fcafc0ce86f2".device = "/dev/disk/by-uuid/20428df9-98ee-45a6-9dc1-fcafc0ce86f2";
  boot.initrd.luks.devices."luks-20428df9-98ee-45a6-9dc1-fcafc0ce86f2".keyFile = "/crypto_keyfile.bin";

  boot.kernelParams = [ "i915.force_probe=9b41" ];

  networking.hostName = "alice-xps"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  system.stateVersion = "23.05"; # Did you read the comment?
}
