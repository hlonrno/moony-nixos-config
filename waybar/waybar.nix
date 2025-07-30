{
  enable = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      spacing = 7;

      modules-left = [ "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ "clock" ];
      modules-right = [ "network" "bluetooth" "pulseaudio" "backlight" "hyprland/language" "privacy" "custom/wlogout" ];

      clock = {
        format = "{:%a, %d.%m.%Yг. %H:%M}";
      };

      "hyprland/workspaces" = {
        format = "";
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
        format-connected = "BL {num_connections}";
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
        icon-size = 14;
        modules = [
          { type = "screenshare"; tooltip = false; }
          { type = "audio-in"; tooltip = false; }
        ];
      };

      "custom/wlogout" = {
        format = "⏻";
        on-click = "wlogout";
      };
    };
  };

  style = ./style.css;
}
