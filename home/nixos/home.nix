{ pkgs, inputs, ... }:

{
  imports = [
    ../common/kitty.nix
    ../common/qutebrowser.nix
    ../common/firefox.nix
  ];

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
    waydroid
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };
}
