{ config, pkgs, ... }:

let 
  astronvim = builtins.fetchGit {
    url = "https://github.com/AstroNvim/AstroNvim";
    rev = "7f087b2ea45073be3386a29e805143f0a1f896e8";
  };
  astronvimUser = builtins.fetchGit {
    url = "https://foo:foo@github.com/morten-olsen/astrovim";
    rev = "44b38567fe3adedd972b5b07f5883d47600a9078";
  };
in {
  programs.neovim.enable = true;
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
