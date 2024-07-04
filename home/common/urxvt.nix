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
    extraConfig = ''
      URxvt*foreground: #c5c8c6
      URxvt*background: #1d1f21
      URxvt*cursorColor: #c5c8c6

      ! black
      URxvt*color0: #282a2e
      URxvt*color8: #373b41

      ! red
      URxvt*color1: #a54242
      URxvt*color9: #cc6666

      ! green
      URxvt*color2: #8c9440
      URxvt*color10: #b5bd68

      ! yellow
      URxvt*color3: #de935f
      URxvt*color11: #f0c674

      ! blue
      URxvt*color4: #5f819d
      URxvt*color12: #81a2be

      ! magenta
      URxvt*color5: #85678f
      URxvt*color13: #b294bb

      ! cyan
      URxvt*color6: #5e8d87
      URxvt*color14: #8abeb7

      ! white
      URxvt*color7: #707880
      URxvt*color15: #c5c8c6

      URxvt.perl-ext-common: config-reload,font-size
      URxvt.letterSpace: 0
      URxvt.lineSpace: 0
      URxvt.geometry: 92x24
      URxvt.internalBorder: 10
      URxvt.cursorBlink: true
      URxvt.cursorUnderline: false
      URxvt.urgentOnBell: true
    '';
  };

  # Optionally, additional configurations
  xsession.windowManager.command = "urxvtd -q -o -f";
}
