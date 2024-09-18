
{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";

  # Enable the KDE Desktop Environment.
  services.displayManager.defaultSession = "plasmax11";
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  programs.kdeconnect.enable = true;
}
