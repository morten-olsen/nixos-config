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

  boot.initrd.availableKernelModules = [
    "aesni_intel"
    "cryptd"
  ];

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  boot.kernelParams = [ "i915.force_probe=9b41" "quiet" ];

  networking.hostName = "alice-xps"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  system.autoUpgrade = {
    enable = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  system.stateVersion = "23.05"; # Did you read the comment?
}
