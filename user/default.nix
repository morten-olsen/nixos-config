{ config, pkgs, lib, ... }:

{
  programs.zsh.enable = true;
  users.users.alice = {
    isNormalUser = true;
    description = "Alice";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
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
