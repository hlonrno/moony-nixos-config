{
  enable = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      modules-left = [ "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ ];
      modules-right = [ "clock" "group/wireless" "group/scrollable" "group/meta" "group/power" ];
      
      "group/wireless" = {
        orientation = "inherit";
        modules = [
          "network"
          "bluetooth"
        ];
      };

      "group/scrollable" = {
        orientation = "inherit";
        modules = [
          "pulseaudio"
          "backlight"
        ];
      };

      "group/meta" = {
        orientation = "inherit";
        modules = [
          "privacy"
          "battery"
        ];
      };

      "group/power" = {
        orientation = "inherit";
        modules = [
          "custom/wlogout"
          "custom/poweroff"
          "custom/reboot"
        ];

        drawer = {
          transition = 300;
          transition-left-to-right = false;
        };
      };

      clock = {
        format = "{:%H:%M}";
        format-alt = "{:%a, %d %b  %H:%M}";
      };

      "hyprland/workspaces" = {
        format = "";
        persistent-workspaces = {
          "*" = 5;
        };
      };

      network = {
        format-ethernet = "Eth.";
        format-wifi = "WiFi";
        format-disconnected = "";
        tooltip-format = "{essid}";
      };

      bluetooth = {
        format = "BL {status}";
        # format-disabled = "";
        format-connected = "BL {num_connections} connected";
        tooltip-format = "{controller_alias}";
        tooltip-format-connected = "{controller_alias}\n{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}";

        on-click = "bluetoothctl power off";
        on-click-right = "bluetoothctl power on";
      };

      pulseaudio = {
        on-click = "pavucontrol";
        format = "{volume}vol";
        format-bluetooth = "BL {volume}vol";
        tooltip-format = "{desc}";
      };

      backlight = {
        format = "{percent}nits";
        on-scroll-up = "brightnessctl s +10";
        on-scroll-down = "brightnessctl s 10-";
      };

      privacy = {
        modules = [
          { type = "screenshare"; tooltip = false; }
          { type = "audio-in"; tooltip = false; }
        ];
      };

      battery = {
        states = {
          good = 100;
          warning = 30;
          critical = 15;
        };

        format = "{capacity}%";
        format-plugged = "{capacity}% P";
        format-good = "";
        tooltip-format = "{time}";
      };

      "custom/wlogout" = {
        format = "⏻";
        on-click = "wlogout";
      };

      "custom/poweroff" = {
        format = "O";
        on-click = "poweroff";
      };

      "custom/reboot" = {
        format = "R";
        on-click = "reboot";
      };
    };
  };

  style = ./style.css;
}
