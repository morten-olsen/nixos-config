{ config, pkgs, lib, ... }:
let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "kitty";
      name = "Launch console";
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      panel-positions = "{\"0\":\"BOTTOM\"}";
      panel-sizes = "{\"0\":48}";
      panel-lengths = "{\"0\":100}";
      appicon-margin = 4;
      animate-appicon-hover = true;
      dot-style-focused = "METRO";
      dot-style-unfocused = "DOTS";
      trans-use-custom-opacity = true;
      trans-panel-opacity = 0.0;
      show-favorites = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
      www = ["<Shift><Super>Return"];
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Super>q"];
      minimize = ["<Super>h"];
      move-to-workspace-1=["<Shift><Super>1"];
      move-to-workspace-2=["<Shift><Super>2"];
      move-to-workspace-3=["<Shift><Super>3"];
      move-to-workspace-4=["<Shift><Super>4"];
      move-to-workspace-left=["<Shift><Super>h"];
      move-to-workspace-right=["<Shift><Super>l"];
      switch-to-workspace-1=["<Super>1"];
      switch-to-workspace-2=["<Super>2"];
      switch-to-workspace-3=["<Super>3"];
      switch-to-workspace-4=["<Super>4"];
      switch-to-workspace-left=["<Super>h"];
      switch-to-workspace-right=["<Super>l"];
      toggle-fullscreen=["<Super>f"];
      toggle-on-all-workspaces=["<Super>p"];
    };

    "org/gnome/desktop/wm/preferences" = {
      workspace-names=["General" "Terminal"];
    };

    "org/gnome/desktop/interface" = {
      color-scheme="prefer-dark";
      scaling-factor=1.5;
      show-battery-percentage=false;
    };

    "org/gnome/desktop/background" = {
      color-shading-type="solid";
      picture-options="zoom";
      picture-uri="file:///home/alice/.wallpaper.jpg";
      picture-uri-dark="file:///home/alice/.wallpaper.jpg";
      primary-color="#000000000000";
      secondary-color="#000000000000";
    };

    "org/gnome/desktop/input-sources" = {
      sources=[
        (mkTuple["xkb" "dk"])
        (mkTuple["xkb" "us"])
      ];
      xkb-options=["caps:escape"];
    };
  };
}
