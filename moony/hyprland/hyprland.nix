{
  enable = true;
  settings = {
    monitor = [ "eDP-1,1920x1080@60,0x0,1" ];
    exec-once = [
      "waybar"
      "hyprpaper"
      "hyprctl setcursor Bibata-Modern-Ice 24"
      "hypridle"
      "systemctl --user start hyprpolkitagent"
      "rfkill unblock bluetooth"
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
      "SUPER, O, exec, pkill waybar"
      "SUPER, P, exec, waybar"

      "SUPER, T, exec, kitty"
      "SUPER, Q, killactive,"
      "SUPER, E, exec, nautilus"
      "SUPER, F, togglefloating,"
      "SUPER SHIFT, F, pseudo,"
      "SUPER, G, togglesplit,"
      "SUPER SHIFT, G, swapnext"
      "SUPER, S, exec, wofi -Gi --show drun"
      "SUPER SHIFT, E, exec, wofi-emoji"
      "SUPER, V, exec, pkill vivaldi; vivaldi"
      "SUPER, Z, pin, active"
      "SUPER, A, exec, lorien"
      "SUPER, B, exec, hyprlock"
      "SUPER, H, movefocus, l"
      "SUPER, L, movefocus, r"
      "SUPER, K, movefocus, u"
      "SUPER, J, movefocus, d"

      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, D, workspace, 9"

      "SUPER SHIFT, 1, movetoworkspace, 1"
      "SUPER SHIFT, 2, movetoworkspace, 2"
      "SUPER SHIFT, 3, movetoworkspace, 3"
      "SUPER SHIFT, 4, movetoworkspace, 4"
      "SUPER SHIFT, 5, movetoworkspace, 5"
      "SUPER SHIFT, D, movetoworkspace, 9"

      "SUPER, SPACE, togglespecialworkspace, magic"
      "SUPER SHIFT, SPACE, movetoworkspace, special:magic"

      ", PRINT, exec, hyprshot -zo ~/Pictures/Screenshots -sm region"
      "SHIFT, PRINT, exec, hyprshot -zo ~/Pictures/Screenshots -sm output"
      "CONTROL, PRINT, exec, hyprshot -zo ~/Pictures/Screenshots -sm window"
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    windowrule = [
      "suppressevent maximize,class:.*"
      "float,class:org.speedcrunch"
    ];
  };
}
