{ config, pkgs, ... }:

{
  virtualisation.docker.enable = true;
  users.groups.docker.members = [ "alice" ];

  environment.systemPackages = with pkgs; [
    docker-compose
    k3s
  ];

  networking.firewall.allowedTCPPorts = [
    6443
  ];

  services.k3s.enable = true;
  services.k3s.role = "server";
  services.k3s.extraFlags = toString [
    # "--disable servicelb"
    "--disable traefik"
  ];
}
