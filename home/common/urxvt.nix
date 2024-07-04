{ config, ... }:

{
  programs.urxvt = {
    enable = true;
    fonts = [ "xft:Monospace:size=10" ];
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
      foreground = "#c5c8c6";
      background = "#1d1f21";
      cursorColor = "#c5c8c6";

      color0 = "#282a2e";
      color8 = "#373b41";

      color1 = "#a54242";
      color9 = "#cc6666";

      color2 = "#8c9440";
      color10 = "#b5bd68";

      color3 = "#de935f";
      color11 = "#f0c674";

      color4 = "#5f819d";
      color12 = "#81a2be";

      color5 = "#85678f";
      color13 = "#b294bb";

      color6 = "#5e8d87";
      color14 = "#8abeb7";

      color7 = "#707880";
      color15 = "#c5c8c6";

      "perl-ext-common" = "config-reload,font-size";
      letterSpace = "0";
      lineSpace = "0";
      geometry = "92x24";
      internalBorder = "10";
      cursorBlink = "true";
      cursorUnderline = "false";
      urgentOnBell = "true";
    };
  };

  # Optionally, additional configurations
  xsession.windowManager.command = "urxvtd -q -o -f";
}
