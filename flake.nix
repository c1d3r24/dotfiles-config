{
  description = "Dotfiles configuration";

  inputs = {
    # Stable Nixpkgs for your desktop
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    # Unstable Nixpkgs for Orange Pi and specific applications
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager from stable and unstable
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-unstable = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Firefox addons from stable and unstable
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons-unstable = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, home-manager-unstable, ... }@inputs:
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
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          system = "x86_64-linux";
          modules = [
            ./hosts/nixos/configuration.nix

          ];
        };
      };


        homeConfigurations = {

          #Nixos Desktop 
          "cidr@nixos" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = {inherit inputs outputs;};
            modules = [ ./home/nixos/home.nix];
           }; 

          #Orangepi 
          "cidr@orangepi" = home-manager-unstable.lib.homeManagerConfiguration {
            pkgs = import nixpkgs-unstable {
              system = "aarch64-linux"; };         
            extraSpecialArgs = {inherit inputs outputs;};
            modules = [ ./home/orangepi/home.nix
            ];
           }; 

        };


      };
}
