{ config, pkgs, lib, ... }:

let 
  astronvim = builtins.fetchGit {
    url = "https://github.com/AstroNvim/AstroNvim";
    rev = "ba0fbdf974eb63639e43d6467f7232929b8b9b4c";
  };
  astronvimUser = builtins.fetchGit {
    url = "https://foo:foo@github.com/morten-olsen/astrovim";
    rev = "295278f715810a2917e0eb38c304cfc290e796d7";
  };
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  home.packages = [
    pkgs.marksman
  ];
  home.file = {
    ".config/nvim" = {
      source = astronvim;
      recursive = true;
    };
    ".config/nvim/lua/user" = {
      source = astronvimUser;
    };
  };
}
