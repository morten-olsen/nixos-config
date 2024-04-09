{ config, pkgs, lib, ... }:

{
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.zsh.enable = true;
  users.users.alice = {
    isNormalUser = true;
    description = "Alice";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  users.users."alice".openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCj8wspkAnOpEmipwB/xd8vpEx9aqNbyjD2xzv0msDJvYMn26ZO3cbtbWbMI9Uns55aHcL0bStdbaJQIcL8ZVzvQtKq+spdZYQpN4cFlN16HXKR/UjBYtJEdHVxb2cwb2DM04aLDuAlCAJGChEAqpIQFpvlByyAaxSPwor5Cy5JHmm5fMkvcJEvPtxQOo4yovY8qW9scWlOCrzNSAYtBwTGG8REcRuTaEW9EJlmn8QZA+T+cE7nFdZOlmm752jW9wBCAIKlg6W5gX0rysSxy+MkKB/2ohpLI+0SeWAM8+CEtZjO7GP6xRPXZgrZJssytzQsJoiMTs6rJM5ovHUMVNPGDLCB6+8lWM7Jk4hh0lIQTOC5AMucH2jRJSyQb2AA3kbPuWOwHDDIlSUnNFsI/xUVs1lfx3ikIZEb9oZcKwWBB2PeL/KT6ca7dsI3PyFL+hC5Wi7ll0Aj5w+dBZOxwW1agSo4ujPKO9oIVwqEA+PqoK/GZtIHAx6t/m3DK8T4HAo2GZMqyzRgcqk1bttaCFzX2h074yW1du8+l4yIqWrooqD474V3MT05HUxkA1+9S5ldEwK4J50WfKlhNuZn5YeiHLngisu8WyIGREYDGlkM+1qxwHiJGohigS20kpmTUkKvyLRXItAcvQYBknCV3qb8B1Kj1bvbN3sCaqQAeVWxDw=="
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFaIAP/ZJ7+7jeR44e1yIJjfQAB6MN351LDKJAXVF62P"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKDbZITpz5QrVIxPn9gKVWMPK+3W3YZZGszFOQvO/h7M"
  ];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 8081 5001 53317 ];
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    #settings.KbdInteractiveAuthentication = false;
    settings.PermitRootLogin = "no";
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "1password-gui"
    "1password"
  ];

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    # Certain features, including CLI integration and system authentication support,
    # require enabling PolKit integration on some desktop environments (e.g. Plasma).
    polkitPolicyOwners = [ "alice" ];
  };
  home-manager.useGlobalPkgs = true;
  home-manager.users.alice = import ./home.nix;
}
