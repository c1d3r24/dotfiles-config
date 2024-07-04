{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "monospace";
      size = 11;
    };
    settings = {
      initial_window_width = "1280";
      initial_window_height = "800";

      enabled_layouts = "grid";

      map shift+up = "move_window up";
      map shift+left = "move_window left";
      map shift+right = "move_window right";
      map shift+down = "move_window down";

      background = "#1c2b35";
      foreground = "#d0d3d4";
      cursor = "#c5c8c9";

      color0 = "#2b3a4a";
      color1 = "#bf616a";
      color2 = "#a3be8c";
      color3 = "#ebcb8b";
      color4 = "#81a1c1";
      color5 = "#b48ead";
      color6 = "#88c0d0";
      color7 = "#e5e9f0";

      color8 = "#4c566a";
      color9 = "#bf616a";
      color10 = "#a3be8c";
      color11 = "#ebcb8b";
      color12 = "#81a1c1";
      color13 = "#b48ead";
      color14 = "#8fbcbb";
      color15 = "#eceff4";

      background_opacity = "0.8";
      bell = "none";
    };
  };
}
