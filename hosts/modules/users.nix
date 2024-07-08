{ config, pkgs, ... }:

{
  users.users.cidr = {
    isNormalUser = true;
    description = "cidr";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
