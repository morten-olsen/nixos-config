{ config, pkgs, nixos-hardware, home-manager, lib, ... }:

{
  imports =
    [
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

  networking.hostName = "test-vm"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  system.stateVersion = "23.05"; # Did you read the comment?
  users.users.alice.initialPassword = "test";
  virtualisation.vmVariant = {
  # following configuration is added only when building VM with build-vm
    virtualisation = {
      memorySize =  2048; # Use 2048MiB memory.
      cores = 3;         
    };
  };
}
