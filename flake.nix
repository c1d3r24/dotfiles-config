{
  description = "Dotfiles configuration";

  inputs = {
    # Stable Nixpkgs for your desktop
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";

    # Unstable Nixpkgs for Orange Pi and specific applications
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager from stable and unstable
    home-manager-stable = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    home-manager-unstable = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Firefox addons from stable and unstable
    firefox-addons-stable = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    firefox-addons-unstable = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

outputs = { self, nixpkgs-stable, nixpkgs-unstable, home-manager-stable, home-manager-unstable, ... }@inputs:
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
          "cidr@nixos" = home-manager-stable.lib.homeManagerConfiguration {
            pkgs = nixpkgs-stable.legacyPackages.x86_64-linux;
            extraSpecialArgs = {inherit inputs outputs;};
            modules = [ ./home/home.nix];
           }; 

          #Orangepi 
          "cidr@orangepi" = home-manager-unstable.lib.homeManagerConfiguration {
            pkgs = nixpkgs-unstable.legacyPackages.aarch64-linux;         
            extraSpecialArgs = {inherit inputs outputs;};
            modules = [ ./home/home.nix
            ];
           }; 

        };


      };
}
