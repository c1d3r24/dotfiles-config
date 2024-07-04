{ config, ... }:

{
  programs.urxvt = {
    enable = true;
    fonts = [ "xft:Monospace:size=11" ];
    iso14755 = false;
    scroll = {
      bar = {
        enable = false;
        position = "right";
        align = "bottom";
        floating = false;
        style = "plain";
      };
      keepPosition = true;
      lines = 2048;
      scrollOnKeystroke = true;
      scrollOnOutput = true;
    };
    transparent = true;
    shading = 30;
    extraConfig = {
      foreground = "#B0B7C3";
      background = "#121212";
      cursorColor = "#B0B7C3";

      color0 = "#1C1C1C";
      color8 = "#373737";

      color1 = "#D24B5A";
      color9 = "#FF6F7B";

      color2 = "#4BD29D";
      color10 = "#6FFFC4";

      color3 = "#D2D24B";
      color11 = "#FFFF6F";

      color4 = "#4B79D2";
      color12 = "#6F9FFF";

      color5 = "#794BD2";
      color13 = "#9F6FFF";

      color6 = "#4BD2D2";
      color14 = "#6FFFFF";

      color7 = "#B0B7C3";
      color15 = "#DCE1E8";

      "perl-ext-common" = "config-reload,font-size";
      letterSpace = "0";
      lineSpace = "0";
      geometry = "80x240+0+0";
      internalBorder = "0";
      cursorBlink = "true";
      cursorUnderline = "false";
      urgentOnBell = "false"; 

      # Added configurations
      inheritPixmap = "true";
      shading = "110";
    };
  };

  # Optionally, additional configurations
  xsession.windowManager.command = "urxvtd -q -o -f";
}
