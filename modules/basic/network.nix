{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  #
  # environment.systemPackages = with pkgs; [ nfs-utils ];
  # boot.initrd.kernelModules = [ "nfs" ];
  # boot.initrd.supportedFilesystems = [ "nfs" ];
  # services.rpcbind.enable = true;
}
