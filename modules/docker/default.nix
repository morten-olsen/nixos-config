{ config, pkgs, ... }:

{
  virtualisation.docker.enable = true;
  users.groups.docker.members = [ "alice" ];

  environment.systemPackages = with pkgs; [
    docker-compose
    kubectl
    colima
  ];
}
