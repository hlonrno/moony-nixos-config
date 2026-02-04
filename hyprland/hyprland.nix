{ ... }: {
  enable = true;
  settings = {
    monitor = [ "eDP-1,1920x1080,0x0,1" "HDMI-A-1,preferred,auto-left,1" ];
    exec-once = [
      "waybar"
      "hyprpaper"
      "systemctl --user start hyprpolkitagent"
      "rfkill unblock bluetooth"
      "hyprctl dispatch workspace 1 && vivaldi"
    ];

    env = [
      "XCURSOR_THEME, Bibata-Modern-Ice"
      "XCURSOR_SIZE, 24"
    ];

    decoration = {
      rounding = 0;
    };

    workspace = [
      "1, monitor:eDP-1, persistent:true"
      "2, monitor:eDP-1, persistent:true"
      "3, monitor:eDP-1, persistent:true"
      "4, monitor:eDP-1, persistent:true"
      "5, monitor:HDMI-A-1, persistent:true"
      "6, monitor:HDMI-A-1, persistent:true"
      "7, monitor:HDMI-A-1, persistent:true"
      "8, monitor:HDMI-A-1, persistent:true"
    ];

    general = {
      gaps_in = 0;
      gaps_out = 0;
      border_size = 2;
      "col.active_border" = "0xffb8b8b8";
      "col.inactive_border" = "0xff777777";
      allow_tearing = false;
      layout = "dwindle";
    };

    animations = {
      enabled = false;

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
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
      new_window_takes_over_fullscreen = 2;
    };

    binds = {
      disable_keybind_grabbing = true;
    };

    input = {
      kb_layout = "us,bg(phonetic)";
      kb_options = "grp:alt_space_toggle, caps:swapescape";
      repeat_rate = 90;
      repeat_delay = 300;
      numlock_by_default = false;

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

    bind = [
      "SUPER, O, execr, pkill waybar"
      "SUPER, P, execr, waybar"

      "SUPER, T, execr, kitty"
      "SUPER, Q, killactive,"
      "SUPER CONTROL SHIFT, Q, forcekillactive,"
      "SUPER, E, execr, nautilus"
      "SUPER, F, togglefloating,"
      "SUPER SHIFT, F, pseudo,"
      "SUPER, G, togglesplit,"
      "SUPER SHIFT, G, swapnext"
      # G - gtk-dark
      # I - app images
      # i - case insensitive
      # e - execute search
      # a - no actions
      # columns: 7, width: 40%; search: fuzzy; show: drun;
      "SUPER, S, execr, tofi-drun"
      "SUPER SHIFT, E, execr, wofi-emoji"
      "SUPER, V, execr, vivaldi"
      "SUPER, Z, pin, active"
      "SUPER, A, execr, krita"
      "SUPER, B, execr, hyprlock"
      "SUPER, Z, execr, woomer"

      "SUPER, H, movefocus, l"
      "SUPER, L, movefocus, r"
      "SUPER, K, movefocus, u"
      "SUPER, J, movefocus, d"

      "SUPER, SPACE, togglespecialworkspace, magic"
      "SUPER SHIFT, SPACE, movetoworkspacesilent, special:magic"

      "SUPER SHIFT CONTROL, 0, execr, hyprctl dispatch dpms off eDP-1"
      "SUPER SHIFT, 0, execr, hyprctl dispatch dpms off"
      "SUPER, 0, execr, hyprctl dispatch dpms on"

      ", PRINT, exec, hyprshot -zo ~/Pictures/Screenshots -sm output"
      "SHIFT, PRINT, exec, hyprshot -zo ~/Pictures/Screenshots -sm window"
      "CONTROL, PRINT, exec, hyprshot -zo ~/Pictures/Screenshots -sm region"
    ] ++ (
      builtins.foldl' (acc: n: acc ++ n) []
      (map (v:
        let
          id = toString v;
          bind = if v == 9 then "D" else toString v;
        in
        [
          "SUPER, ${bind}, workspace, ${id}"
          "SUPER SHIFT, ${bind}, movetoworkspacesilent, ${id}"
        ]
      ) [ 1 2 3 4 5 6 7 8 ])
    );

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    windowrule = [
      "float,title:SpeedCrunch"
    ];
  };
}
