{ config, pkgs, ... }:

{
  home.file = {
    ".gnupg" = {
      source = ./files;
      recursive = true;
    };
  };
}
