{ config, pkgs, ... }:

{
  # Configure obinskit in 23.11 channel
  nixpkgs.config = {
    packageOverrides = pkgs: {
      oldversion = import (fetchTarball {
        url = "https://releases.nixos.org/nixos/23.11/nixos-23.11.7609.5c2ec3a5c2ee/nixexprs.tar.xz";
      }) {
        config = config.nixpkgs.config;
      };
    };
  };

  # Systemd service for obinskit to keep keyboard awake
  systemd.services.obinskit-headless = {
    enable = true;
    description = "Obinskit headless";
    after = [ "network.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.xvfb-run}/bin/xvfb-run -a ${pkgs.oldversion.obinskit}/bin/obinskit --no-sandbox";
      Restart = "always";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
