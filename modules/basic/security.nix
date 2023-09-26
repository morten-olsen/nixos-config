{ config, pkgs, ... }:

{
  # enable smart card reader driver
  services.pcscd.enable = true;
  security.apparmor.enable = true;
  programs.firejail.enable = true;
  programs.firejail.wrappedBinaries = {
    signal-desktop = {
      executable = "${pkgs.signal-desktop}/bin/signal-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland";
      profile = "${pkgs.firejail}/etc/firejail/signal-desktop.profile";
      extraArgs = [ "--env=LC_ALL=C" "--env=GTK_THEME=Adwaita:dark" ];
    };
  };

  # yubikey stuff
  services.udev.packages = [ pkgs.yubikey-personalization ];
  environment.systemPackages = [
    pkgs.yubikey-personalization
    pkgs.yubikey-personalization-gui
    pkgs.yubikey-manager
    pkgs.yubikey-manager-qt
    pkgs.yubioath-flutter
    pkgs.gnupg
    pkgs.pinentry-gnome
  ];
}
