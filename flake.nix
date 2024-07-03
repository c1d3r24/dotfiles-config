{
  description = "My NixOS configuration";

  inputs = {
    # Nix ecosystem
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        # Define your NixOS configurations here
        nixos = nixpkgs.lib.nixosSystem {
          system = system;
          modules = [
            ./hosts/nixos/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        "cidr@nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          modules = [ ./home/home.nix ];
        };
      };
    };
}
