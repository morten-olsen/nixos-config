{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    controlMaster = "auto";
    controlPath = "~/controls-ssh-%r@%h:%p";
    extraConfig = ''
      IdentityAgent ~/.1password/agent.sock
    '';
  };
}
