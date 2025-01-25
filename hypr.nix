{
  enable = true;
  extraConfig = builtins.readFile ./hypr-keybinds.conf;
  settings = {
    monitor = [ "eDP-1,1920x1080@60,0x0,1" ];
    exec-once = [
      "waybar"
      "hyprpaper"
    ];

    decoration = {
      rounding = 5;
    };

    general = {
      gaps_in = 2;
      gaps_out = 4;
      border_size = 3;
      "col.active_border" = "rgba(eeeeeeff)";
      "col.inactive_border" = "rgba(111111ff)";
      allow_tearing = false;
      layout = "dwindle";
    };

    animations = {
      enabled = true;

      bezier = "bz, 0.2, 1, 0, 1";

      animation = [
        "windows, 1, 7, bz"
        "windowsOut, 1, 7, bz"
        "border, 1, 10, bz"
        "borderangle, 1, 8, bz"
        "fade, 1, 7, bz"
        "workspaces, 1, 6, bz"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      force_default_wallpaper = -1;
      disable_hyprland_logo = true;
      vfr = true;
      new_window_takes_over_fullscreen = 2;
    };

    binds = {
      disable_keybind_grabbing = true;
    };

    input = {
      kb_layout = "us,bg(phonetic)";
      kb_options = "grp:alt_space_toggle";
      repeat_rate = 90;
      repeat_delay = 300;
      numlock_by_default = true;

      follow_mouse = 1;
      sensitivity = 1;
      accel_profile = "flat";

      scroll_method = "2fg";
      touchpad = {
        natural_scroll = true;
        disable_while_typing = true;
        drag_lock = true;
      };
    };

    gestures = {
      workspace_swipe = false;
    };

    device = {
      name = "epic-mouse-v1";
      sensitivity = 1;
    };
  };
}
