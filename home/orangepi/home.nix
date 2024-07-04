{ config, pkgs, inputs, ... }:

let
  unstablePkgs = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
in

{
  imports = [
    ../common/urxvt.nix
    ../common/qutebrowser.nix
    ../common/firefox.nix
  ];

  nix = {
    package = unstablePkgs.nix;
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

  home.packages = with unstablePkgs; [
    kate
    qutebrowser
    vlc
    wireshark
    fastfetch
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };
}
