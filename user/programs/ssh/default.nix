{ config, pkgs, ... }:

{
  home.file = {
    ".ssh" = {
      source = ./files;
      recursive = true;
    };
  };
}
