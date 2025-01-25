{
  enabled = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      spacing = 7;
      modules-left = [ "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ "clock" ];
      modules-right = [ "backlight/slider" "pulseaudio" "battery" "network" "custom/power" ];

      "hyprland/workspaces" = {
        max-length = 75;
      };

      battery = {
        state = {
          full = 100;
          warning = 35;
          critical = 15;
        };

        format-full = "";
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
        format-alt = "{:%a, %d, %b  %H:%M}";
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

  style = ./waybar-style.css;
}
