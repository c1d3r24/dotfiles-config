{
  description = "My NixOS configuration";

  inputs = {
    # Nix ecosystem
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };


  };

outputs = { self, nixpkgs-stable, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      system = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"];
    in {

      nixosConfigurations = {

		#Nixos Desktop
        nixos = nixpkgs-stable.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          system = system;
          modules = [
            ./hosts/nixos/configuration.nix

          ];
        };
      };


        homeConfigurations = {

          #Nixos Desktop 
          "cidr@nixos" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs-stable.legacyPackages.x86_64-linux;
            extraSpecialArgs = {inherit inputs outputs;};
            modules = [ ./home/home.nix];
           }; 

          #Orangepi 
          "cidr@orangepi" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs-unstable.legacyPackages.aarch64-linux;         
            extraSpecialArgs = {inherit inputs outputs;};
            modules = [ ./home/home.nix
            ];
           }; 

        };


      };
}
