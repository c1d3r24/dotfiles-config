{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = system;
          modules = [
            ./hosts/nixos/configuration.nix

            home-manager.nixosModules.home-manager {
              home-manager.useUserPackages = true;
              home-manager.users.cidr = import ./home/home.nix;
            }
          ];
        };
      };
    };
}
