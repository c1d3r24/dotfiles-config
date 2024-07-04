{ config, ... }:

{
  programs.urxvt = {
    enable = true;
    font = "xft:Monospace:size=10";
    scrollBar = false;
    scrollBar_right = false;
    depth = 24;
    borderLess = true;
    lineSpacing = 0;
    letterSpace = 0;
    geometry = "92x24";
    internalBorder = 10;
    cursorBlink = true;
    cursorUnderline = false;
    saveLine = 2048;
    urgentOnBell = true;
    iso14755 = false;

    # Colors
    foreground = "#c5c8c6";
    background = "#1d1f21";
    cursorColor = "#c5c8c6";
    colors = {
      black   = "#282a2e";
      red     = "#a54242";
      green   = "#8c9440";
      yellow  = "#de935f";
      blue    = "#5f819d";
      magenta = "#85678f";
      cyan    = "#5e8d87";
      white   = "#707880";

      brightBlack   = "#373b41";
      brightRed     = "#cc6666";
      brightGreen   = "#b5bd68";
      brightYellow  = "#f0c674";
      brightBlue    = "#81a2be";
      brightMagenta = "#b294bb";
      brightCyan    = "#8abeb7";
      brightWhite   = "#c5c8c6";
    };

    # Transparency settings
    transparent = true;
    shading = 30;

    # Perl extensions
    perlExtCommon = "config-reload,font-size";
  };

  # Optionally, additional configurations
  xsession.windowManager.command = "urxvtd -q -o -f";
}
