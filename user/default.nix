{ config, pkgs, lib, ... }:

{
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.zsh.enable = true;
  users.users.alice = {
    isNormalUser = true;
    description = "Alice";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

networking.firewall = {
  enable = true;
  allowedTCPPorts = [ 8081 5001 ];
};

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "1password-gui"
    "1password"
  ];

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    # Certain features, including CLI integration and system authentication support,
    # require enabling PolKit integration on some desktop environments (e.g. Plasma).
    polkitPolicyOwners = [ "alice" ];
  };
  home-manager.useGlobalPkgs = true;
  home-manager.users.alice = import ./home.nix;
}
