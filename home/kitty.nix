{ inputs, config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      family = "monospace";
      size = 11.0;
    };

    settings = {
      # Performance tuning
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = true;

      # Scrollback
      scrollback_lines = 2000;
      scrollback_indicator_opacity = 1.0;

      # Mouse actions
      mouse_map = "left click ungrabbed mouse_handle_click selection link prompt";

      # Tab bar customization
      tab_bar_margin_width = 0.0;
      tab_bar_margin_height = "0.0 0.0";
      tab_bar_style = "fade";
      tab_bar_align = "left";
      tab_bar_min_tabs = 2;
      tab_fade = "0.25 0.5 0.75 1";
      tab_separator = " ┇";
      tab_powerline_style = "angled";
      active_tab_foreground = "#000";
      active_tab_background = "#eee";
      active_tab_font_style = "bold-italic";
      inactive_tab_foreground = "#444";
      inactive_tab_background = "#999";
      inactive_tab_font_style = "normal";

      # Advanced options
      allow_remote_control = false;
      enable_audio_bell = false;
      visual_bell_duration = 0.0;
      window_alert_on_bell = true;
      bell_on_tab = "🔔 ";
    };
  };
}
