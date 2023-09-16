{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font Mono Reg";
      size = 12;
      package = (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; });
    };
    settings = {
      # Enable ligatures
      draw_ligatures = true;

      italic_font = "auto";
      bold_italic_font = "auto";
      disable_ligatures = "cursor";
      enable_audio_bell = false;
      bell_on_tab = false;
      background_opacity = "0.8";
    };
  };
}
