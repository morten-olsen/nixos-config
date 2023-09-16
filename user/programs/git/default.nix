{ config, pkgs, ... }:

{
  imports = [
    ../gnupg
  ];
  programs.git = {
    enable = true;
    userName = "Morten Olsen";
    userEmail = "fbtijfdq@void.black";
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFaIAP/ZJ7+7jeR44e1yIJjfQAB6MN351LDKJAXVF62P";
      signByDefault = true;
    };
    aliases = {
      graph = "log --graph --color --pretty=format:'%C(yellow)%H%C(green)%d%C(reset)%n%x20%cd%n%x20%cn%C(blue)%x20(%ce)%x20%C(cyan)[gpg:%GK%x20%G?]%C(reset)%n%x20%s%n'";
      ll = "log --oneline";
      st = "status -sb";
      cm = "commit -m";
      append = "commit --amend --no-edit";
      sobmodules = "submodule update --init --recursive";
      df = "difftool -t nvimdiff -y";
      last = "log -1 --stat2";
      br = "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
      brr = "branch --remote --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
      undo = "reset HEAD~1 --mixed";
      unstage = "reset HEAD --";
    };
    extraConfig = {
      interactive = {
        diffFilter = "delta --color-only";
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        ff = "only";
      };
      core = {
        pager = "delta";
      };
      difftool = {
        nvimdiff = {
	        cmd = "nvim -d \"$LOCAL\" \"$REMOTE\"";
        };
      };
      gpg = {
        format = "ssh";
        ssh = {
          program = "${pkgs._1password-gui}/share/1password/op-ssh-sign";
        };
      };
      url = {
        "git@github.com:morten-olsen/" = {
          insteadOf = "https://github.com/morten-olsen/";
        };
        "https://" = {
          insteadOf = "git://";
        };
      };
    };
  };
}
