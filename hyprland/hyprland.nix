{ pkgs  }: {
  enable = true;
  settings = {
    monitor = [ "eDP-1,1920x1080,0x0,1" ",preferred,auto-left,auto" ];
    exec-once = [
      "waybar"
      "hyprpaper"
      "systemctl --user start hyprpolkitagent"
      "rfkill unblock bluetooth"
    ];

    env = [
      "XCURSOR_THEME, Bibata-Modern-Ice"
      "XCURSOR_SIZE, 24"
    ];

    decoration = {
      rounding = 5;
    };

    general = {
      gaps_in = 2;
      gaps_out = 4;
      border_size = 3;
      "col.active_border" = "0xff6590fd";
      "col.inactive_border" = "0xff4b4c53";
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
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
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
      "SUPER, S, execr, wofi -Gi --show drun"
      "SUPER SHIFT, E, execr, wofi-emoji"
      "SUPER, V, execr, vivaldi"
      "SUPER, Z, pin, active"
      "SUPER, A, execr, krita"
      "SUPER, B, execr, hyprlock"
      "SUPER, H, movefocus, l"
      "SUPER, L, movefocus, r"
      "SUPER, K, movefocus, u"
      "SUPER, J, movefocus, d"

      "SUPER, SPACE, togglespecialworkspace, magic"
      "SUPER SHIFT, SPACE, movetoworkspacesilent, special:magic"

      ", PRINT, exec, hyprshot -zo ~/Pictures/Screenshots -sm region"
      "SHIFT, PRINT, exec, hyprshot -zo ~/Pictures/Screenshots -sm output"
      "CONTROL, PRINT, exec, hyprshot -zo ~/Pictures/Screenshots -sm window"
    ] ++ (
      pkgs.lib.pipe [ 1 2 3 4 5 9 ] [
        (map (v:
          let
            id = toString v;
            bind = if v == 9 then "D" else toString v;
          in
         [
            "SUPER, ${bind}, workspace, ${id}"
            "SUPER SHIFT, ${bind}, movetoworkspacesilent, ${id}"
          ]
        ))
        (builtins.foldl' (acc: n: acc ++ n) [])
      ]
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
