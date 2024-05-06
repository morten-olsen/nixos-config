{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nixVersions.latest;
    settings = {
      sandbox = true;
      cores = 0;
      trusted-users = [ "@wheel" ];
      substituters = [ "https://cache.nixos.org/" ];
      builders-use-substitutes = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
