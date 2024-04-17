# https://github.com/michaelpj/nixos-config 
# https://github.com/HeinzDev/Hyprland-dotfiles/blob/main/nixos/configuration.nix
# https://hoverbear.org/blog/declarative-gnome-configuration-in-nixos/
{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
    };
    themes = {
      url = "github:RGBCube/ThemeNix";
    };
    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, nur, themes }: {
    nixosConfigurations = {
      alice-xps = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
          { nixpkgs.overlays = [ nur.overlay ]; }
          (import ./machines/xps/configuration.nix) 
          ({
              # Let 'nixos-version --json' know about the Git revision
              # of this flake.
              system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;
          })
          ({
              # For compatibility with other things, puts nixpkgs into NIX_PATH
              environment.etc.nixpkgs.source = nixpkgs;
              nix.nixPath = ["nixpkgs=/etc/nixpkgs"];
          })
        ];
        specialArgs = { inherit nixos-hardware home-manager; };
      };
      vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
          { nixpkgs.overlays = [ nur.overlay ]; }
          (import ./machines/vm/configuration.nix) 
          ({
              # Let 'nixos-version --json' know about the Git revision
              # of this flake.
              system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;
          })
          ({
              # For compatibility with other things, puts nixpkgs into NIX_PATH
              environment.etc.nixpkgs.source = nixpkgs;
              nix.nixPath = ["nixpkgs=/etc/nixpkgs"];
          })
        ];
        specialArgs = { inherit nixos-hardware home-manager; };
      };
    };

  };
}
