{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;

    extraConfig = ''
      # vim:fileencoding=utf-8:foldmethod=marker

      #: Fonts {{{

      font_family monospace
      bold_font auto
      italic_font auto
      bold_italic_font auto

      font_size 11.0

      force_ltr no

      # Font features and ligatures
      disable_ligatures never

      #: Cursor customization {{{

      cursor #cccccc
      cursor_text_color #111111
      cursor_shape block
      cursor_beam_thickness 1.5
      cursor_underline_thickness 2.0
      cursor_blink_interval -1
      cursor_stop_blinking_after 15.0

      #: Scrollback {{{

      scrollback_lines 2000
      scrollback_indicator_opacity 1.0
      scrollback_pager less --chop-long-lines --RAW-CONTROL-CHARS +INPUT_LINE_NUMBER
      scrollback_pager_history_size 0
      scrollback_fill_enlarged_window no
      wheel_scroll_multiplier 5.0
      wheel_scroll_min_lines 1
      touch_scroll_multiplier 1.0

      #: Mouse {{{

      mouse_hide_wait 3.0
      url_color #0087bd
      url_style curly
      open_url_with default
      url_prefixes file ftp ftps gemini git gopher http https irc ircs kitty mailto news sftp ssh
      detect_urls yes
      url_excluded_characters
      show_hyperlink_targets no
      underline_hyperlinks hover
      copy_on_select no
      paste_actions quote-urls-at-prompt,confirm
      strip_trailing_spaces never
      select_by_word_characters @-./_~?&=%+#
      select_by_word_characters_forward
      click_interval -1.0
      focus_follows_mouse no
      pointer_shape_when_grabbed arrow
      default_pointer_shape beam
      pointer_shape_when_dragging beam

      # Mouse actions
      mouse_map left click ungrabbed mouse_handle_click selection link prompt
      mouse_map shift+left click grabbed,ungrabbed mouse_handle_click selection link prompt
      mouse_map ctrl+shift+left release grabbed,ungrabbed mouse_handle_click link
      mouse_map ctrl+shift+left press grabbed discard_event
      mouse_map middle release ungrabbed paste_from_selection
      mouse_map left press ungrabbed mouse_selection normal
      mouse_map ctrl+alt+left press ungrabbed mouse_selection rectangle
      mouse_map left doublepress ungrabbed mouse_selection word
      mouse_map left triplepress ungrabbed mouse_selection line
      mouse_map ctrl+alt+left triplepress ungrabbed mouse_selection line_from_point
      mouse_map right press ungrabbed mouse_selection extend
      mouse_map shift+middle release ungrabbed,grabbed paste_selection
      mouse_map shift+middle press grabbed discard_event
      mouse_map shift+left press ungrabbed,grabbed mouse_selection normal
      mouse_map ctrl+shift+alt+left press ungrabbed,grabbed mouse_selection rectangle
      mouse_map shift+left doublepress ungrabbed,grabbed mouse_selection word
      mouse_map shift+left triplepress ungrabbed,grabbed mouse_selection line
      mouse_map ctrl+shift+alt+left triplepress ungrabbed,grabbed mouse_selection line_from_point
      mouse_map shift+right press ungrabbed,grabbed mouse_selection extend
      mouse_map ctrl+shift+right press ungrabbed mouse_show_command_output

      #: Performance tuning {{{

      repaint_delay 10
      input_delay 3
      sync_to_monitor yes

      #: Terminal bell {{{

      enable_audio_bell no
      visual_bell_duration 0.0
      visual_bell_color none
      window_alert_on_bell yes
      bell_on_tab "🔔 "
      command_on_bell none
      bell_path none
      linux_bell_theme __custom

      #: Window layout {{{

      initial_window_width 1280
      initial_window_height 800
      enabled_layouts grid
      map shift+up move_window up
      map shift+left move_window left
      map shift+right move_window right
      map shift+down move_window down

      #: Tab bar {{{

      tab_bar_edge bottom
      tab_bar_margin_width 0.0
      tab_bar_margin_height 0.0 0.0
      tab_bar_style fade
      tab_bar_align left
      tab_bar_min_tabs 2
      tab_switch_strategy previous
      tab_fade 0.25 0.5 0.75 1
      tab_separator " ┇"
      tab_powerline_style angled
      tab_activity_symbol none
      tab_title_max_length 0
      tab_title_template "{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{title}"
      active_tab_title_template none
      active_tab_foreground #000
      active_tab_background #eee
      active_tab_font_style bold-italic
      inactive_tab_foreground #444
      inactive_tab_background #999
      inactive_tab_font_style normal
      tab_bar_background none
      tab_bar_margin_color none

      #: Color scheme {{{

      background #1c2b35
      foreground #d0d3d4
      cursor #c5c8c9

      color0 #2b3a4a
      color1 #bf616a
      color2 #a3be8c
      color3 #ebcb8b
      color4 #81a1c1
      color5 #b48ead
      color6 #88c0d0
      color7 #e5e9f0

      color8 #4c566a
      color9 #bf616a
      color10 #a3be8c
      color11 #ebcb8b
      color12 #81a1c1
      color13 #b48ead
      color14 #8fbcbb
      color15 #eceff4

      background_opacity 0.8

      #: Advanced {{{

      close_on_child_death no
      allow_remote_control no
      shell_integration enabled

      #: OS specific tweaks {{{

      linux_display_server auto
      wayland_enable_ime yes

      #: Keyboard shortcuts {{{

      kitty_mod ctrl+shift

      map kitty_mod+c copy_to_clipboard
      map cmd+c copy_to_clipboard
      map kitty_mod+v paste_from_clipboard
      map cmd+v paste_from_clipboard
      map kitty_mod+s paste_from_selection
      map shift+insert paste_from_selection

      map kitty_mod+up scroll_line_up
      map kitty_mod+down scroll_line_down
      map kitty_mod+page_up scroll_page_up
      map kitty_mod+page_down scroll_page_down
      map kitty_mod+home scroll_home
      map kitty_mod+end scroll_end
      map kitty_mod+z scroll_to_prompt -1
      map kitty_mod+x scroll_to_prompt 1
      map kitty_mod+h show_scrollback
      map kitty_mod+g show_last_command_output

      map kitty_mod+enter new_window
      map cmd+enter new_window
      map kitty_mod+n new_os_window
      map cmd+n new_os_window
      map kitty_mod+w close_window
      map shift+cmd+d close_window
      map kitty_mod+] next_window
      map kitty_mod+[ previous_window
      map kitty_mod+f move_window_forward
      map kitty_mod+b move_window_backward
      map kitty_mod+` move_window_to_top
      map kitty_mod+r start_resizing_window
      map cmd+r start_resizing_window
      map kitty_mod+1 first_window
      map cmd+1 first_window
      map kitty_mod+2 second_window
      map cmd+2 second_window
      map kitty_mod+3 third_window
      map cmd+3 third_window
      map kitty_mod+4 fourth_window
      map cmd+4 fourth_window
      map kitty_mod+5 fifth_window
      map cmd+5 fifth_window
      map kitty_mod+6 sixth_window
      map cmd+6 sixth_window
      map kitty_mod+7 seventh_window
      map cmd+7 seventh_window
      map kitty_mod+8 eighth_window
      map cmd+8 eighth_window
      map kitty_mod+9 ninth_window
      map cmd+9 ninth_window
      map kitty_mod+0 tenth_window
      map kitty_mod+f7 focus_visible_window
      map kitty_mod+f8 swap_with_window

      map kitty_mod+right next_tab
      map shift+cmd+] next_tab
      map ctrl+tab next_tab
      map kitty_mod+left previous_tab
      map shift+cmd+[ previous_tab
      map ctrl+shift+tab previous_tab
      map kitty_mod+t new_tab
      map cmd+t new_tab
      map kitty_mod+q close_tab
      map cmd+w close_tab
      map shift+cmd+w close_os_window
      map kitty_mod+. move_tab_forward
      map kitty_mod+, move_tab_backward
      map kitty_mod+alt+t set_tab_title
      map shift+cmd+i set_tab_title

      map kitty_mod+l next_layout

      map kitty_mod+equal change_font_size all +2.0
      map kitty_mod+plus change_font_size all +2.0
      map kitty_mod+kp_add change_font_size all +2.0
      map cmd+plus change_font_size all +2.0
      map cmd+equal change_font_size all +2.0
      map shift+cmd+equal change_font_size all +2.0
      map kitty_mod+minus change_font_size all -2.0
      map kitty_mod+kp_subtract change_font_size all -2.0
      map cmd+minus change_font_size all -2.0
      map shift+cmd+minus change_font_size all -2.0
      map kitty_mod+backspace change_font_size all 0
      map cmd+0 change_font_size all 0

      map kitty_mod+f6 change_font_size all 10.0
      map kitty_mod+f6 change_font_size current 10.0

      map kitty_mod+e open_url_with_hints
      map kitty_mod+p>f kitten hints --type path --program -
      map kitty_mod+p>shift+f kitten hints --type path
      map kitty_mod+p>l kitten hints --type line --program -
      map kitty_mod+p>w kitten hints --type word --program -
      map kitty_mod+p>h kitten hints --type hash --program -
      map kitty_mod+p>n kitten hints --type linenum
      map kitty_mod+p>y kitten hints --type hyperlink

      map kitty_mod+f1 show_kitty_doc overview
      map kitty_mod+f11 toggle_fullscreen
      map ctrl+cmd+f toggle_fullscreen
      map kitty_mod+f10 toggle_maximized
      map opt+cmd+s toggle_macos_secure_keyboard_entry
      map kitty_mod+u kitten unicode_input
      map ctrl+cmd+space kitten unicode_input
      map kitty_mod+f2 edit_config_file
      map cmd+, edit_config_file
      map kitty_mod+escape kitty_shell window
      map kitty_mod+a>m set_background_opacity +0.1
      map kitty_mod+a>l set_background_opacity -0.1
      map kitty_mod+a>1 set_background_opacity 1
      map kitty_mod+a>d set_background_opacity default
      map kitty_mod+delete clear_terminal reset active
      map opt+cmd+r clear_terminal reset active
      map cmd+k clear_terminal to_cursor active
      map kitty_mod+f5 load_config_file
      map ctrl+cmd+, load_config_file
      map kitty_mod+f6 debug_config
      map opt+cmd+, debug_config
      map shift+cmd+/ open_url https://sw.kovidgoyal.net/kitty/
      map cmd+h hide_macos_app
      map opt+cmd+h hide_macos_other_apps
      map cmd+m minimize_macos_window
      map cmd+q quit

      #: }}}
    '';
  };
}
