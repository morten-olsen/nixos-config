{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  #
  environment.systemPackages = with pkgs; [ nfs-utils ];
  boot.initrd.supportedFilesystems = [ "nfs" ];
  # boot.initrd.kernelModules = [ "nfs" ];
  # services.rpcbind.enable = true;
}
