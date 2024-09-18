{ config, pkgs, ... }:

{
  services = {
    syncthing = {
        enable = true;
        user = "cidr";
        dataDir = "/home/cidr/.Notes";    # Default folder for new synced folders
        configDir = "/home/cidr/.config/syncthing";   # Folder for Syncthing's settings and keys
    };
};

}
