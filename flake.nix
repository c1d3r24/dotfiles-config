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
      inherit (self) outputs;
      system = "x86_64-linux";
    in {

      nixosConfigurations = {


        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          system = system;
          modules = [
            ./hosts/nixos/configuration.nix

            home-manager.nixosModules.home-manager {
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = { inherit inputs outputs;};
              home-manager.users.cidr = {
               imports = [
                 ./home/home.nix 
                ];
              }; 
            }
          ];
        };



      };
    };
}
