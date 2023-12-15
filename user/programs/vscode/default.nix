{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      vscodevim.vim
      github.copilot
      ms-kubernetes-tools.vscode-kubernetes-tools
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      github.github-vscode-theme
      catppuccin.catppuccin-vsc
    ];
  };
}
