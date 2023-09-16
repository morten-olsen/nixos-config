{ config, pkgs, ... }:

let 
  astronvim = builtins.fetchGit {
    url = "https://github.com/AstroNvim/AstroNvim";
    rev = "dad0bec1fef2833561d04ea446a544fbfde92539";
  };
  astronvimUser = builtins.fetchGit {
    url = "https://foo:foo@github.com/morten-olsen/astrovim";
    rev = "44b38567fe3adedd972b5b07f5883d47600a9078";
  };
in {
  programs.neovim.enable = true;
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
