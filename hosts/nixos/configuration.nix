# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
     ../modules/bootloader.nix
    ../modules/networking.nix
    ../modules/i18n.nix
    ../modules/gnome.nix
    ../modules/users.nix
    ../modules/mounts.nix
    ../modules/packages.nix
    ../modules/services/sound.nix
    ../modules/services/steam.nix
    ../modules/services/tailscale.nix
    ../modules/services/obinskit.nix
    ../modules/services/virtualization.nix
    ../modules/services/bluetooth.nix
    ../modules/nvidia.nix
    ];


  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Enable OpenGL on 24.11
  #hardware.graphics = {
  #  enable = true;
  #  enable32Bit = true;
  #};


  enviroment.extraInit =  ''
	xset dpms 120
  ''; 
  
  # Enable OpenGL on 24.05
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}

