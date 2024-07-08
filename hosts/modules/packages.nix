{ config, pkgs, ... }:

{
  nixpkgs.config.permittedInsecurePackages = [
    "electron-13.6.9"
    "electron-19.1.9"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    cryptsetup
    gparted
    bat 
    tree
    nmap
    htop
    fastfetch
    whois
    traceroute
    inetutils
    virt-viewer
    git
    jq
    tailscale
    dig
    iperf3
    tmux
    wget
    vim
    cifs-utils
    wireguard-tools
    python3
    xvfb-run
    btrbk
    oldversion.obinskit
    oldversion.etcher
    #GNOME stuff 
    gnome.gnome-tweaks
    hydrapaper
    orchis-theme
    epapirus-icon-theme
    dconf
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
