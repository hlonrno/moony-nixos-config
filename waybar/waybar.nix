{
  enable = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";

      modules-left = [ "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ "clock" ];
      modules-right = [ "network" "bluetooth" "pulseaudio" "backlight" "hyprland/language" "privacy" "battery" "custom/wlogout" ];

      clock = {
        format = "{:%a, %d.%m.%Yг. %H:%M}";
      };

      "hyprland/workspaces" = {
        format = "{icon}";
        "persistent-workspaces" = {
          "eDP-1" = [ 1 2 3 4 ];
          "HDMI-1" = [ 5 6 7 8 ];
        };
      };

      "hyprland/window" = {
        max-length = 200;
      };

      network = {
        format-ethernet = "Eth.";
        format-wifi = "WiFi";
        format-disconnected = "";
        tooltip-format = "{essid}";
      };

      bluetooth = {
        format = "BL {status}";
        format-disabled = "BL";
        format-connected = "BL {num_connections}con";
        tooltip-format = "{controller_alias}";
        tooltip-format-connected = "{controller_alias}\n{device_enumerate}";

        on-click = "bluetoothctl power off";
        on-click-right = "bluetoothctl power on";
      };

      pulseaudio = {
        on-click = "pavucontrol";
        format = "{volume}vol";
        format-bluetooth = "{volume}vol BL";
        tooltip-format = "{desc}";
      };

      backlight = {
        format = "{percent}sun";
        on-scroll-up = "brightnessctl s +5%";
        on-scroll-down = "brightnessctl s 5%-";
      };


      "hyprland/language" = {
        format = "{}";
        format-bg = "БДС";
        format-en = "US";
      };

      privacy = {
        icon-size = 15;
        modules = [
          { type = "screenshare"; tooltip = false; }
          { type = "audio-in"; tooltip = false; }
        ];
      };

      battery = {
        format-full = "";
      };

      "custom/wlogout" = {
        format = "⏻";
        on-click = "wlogout";
      };
    };
  };

  style = ./style.css;
}
