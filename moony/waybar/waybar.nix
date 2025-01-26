{
  enable = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      modules-left = [ "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ ];
      modules-right = [ "" "backlight" "pulseaudio" "clock" "custom/power" ];

      "hyprland/workspaces" = {
        format = "";
        persistent-workspaces = {
          "*" = 6;
        };
      };

      battery = {
        state = {
          full = 100;
          warning = 35;
          critical = 16;
        };

        format-warning = "{capacity}% charge soon.";
        format-critical = "{capacity}% CHARGE NOW!";
        format = "{capacity%} charge";
      };

      pulseaudio = {
        on-click = "pavucontrol";
        format = "{volume}% volume";
      };

      clock = {
        format = "{:%H:%M}";
        format-alt = "{:%a, %d %b  %H:%M}";
      };

      network = {
        format-wifi = "WiFI {signalStrength}%";
        format-disconnected = "Disconnected";
        format-ethernet = "Ethernet";
        tooltip-format = "{essid}";
      };

      "custom/power" = {
        format = "⏻";
        on-click = "wlogout";
      };
    };
  };

  style = ./style.css;
}
