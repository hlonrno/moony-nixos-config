{
  enable = true;
  extraConfig = builtins.readFile ./macchiato.conf;
  settings = {
    cursor_shape = "underline";
    cursor_blink_interval = -1;
    scrollback_lines = 5000;
    scrollback_indicator_opacity = 0.3;
    touch_scroll_multiplier = 3;
    mouse_hide_wait = -1;
    url_style = "dotted";
    show_hyprerlink_targets = "yes";
    enable_terminal_bell = "no";
    active_border_color = "none";
    confirm_os_window_close = 0;
    background_opacity = 0.95;
    font_family = "family=\"JetBrainsMono Nerd Font\"";
    disable_ligatures = "always";
  };
}
