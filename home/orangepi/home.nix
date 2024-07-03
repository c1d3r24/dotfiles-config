{ config, pkgs, inputs, ... }:

let
  pkgs = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
in

{
  imports = [
    ../common/kitty.nix
    ../common/qutebrowser.nix
    ../common/firefox.nix
  ];

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  home.username = "cidr";
  home.homeDirectory = "/home/cidr";
  home.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "c1d3r24";
  };

  home.packages = with pkgs; [
    kate
    qutebrowser
    spotify
    discord
    google-chrome
    vlc
    cura
    deluge
    desmume
    tor-browser-bundle-bin
    onlyoffice-bin
    plex-media-player
    steam
    wireshark
    kitty
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };
}
