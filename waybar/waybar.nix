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
        tooltip = false;
      };

      "hyprland/workspaces" = {
        format = "{icon}";
        "persistent-workspaces" = {
          "eDP-1" = [ 1 2 3 4 ];
          "HDMI-A-1" = [ 5 6 7 8 ];
        };
      };

      "hyprland/window" = {
        format = "󰅂 [{class}] {title}";
        max-length = 120;
      };

      network = {
        format-ethernet = "󰈀 {signalStrength}";
        format-wifi = "󰖩 {signalStrength}";
        format-disconnected = "";
        tooltip-format = "{essid}";
      };

      bluetooth = {
        format = "";
        format-enabled = "󰂲 {controller_alias}";
        format-connected = "󰂱 {num_connections}";
        tooltip-format = "{controller_alias}";
        tooltip-format-connected = "{controller_alias}\n{device_enumerate}";
      };

      pulseaudio = {
        on-click = "pavucontrol";
        format = "󰕾 {volume}";
        format-bluetooth = "󰂰 {volume}";
        tooltip-format = "{desc}";
      };

      backlight = {
        format = " {percent}";
        tooltip = false;
        on-scroll-up = "brightnessctl s +5%";
        on-scroll-down = "brightnessctl s 5%-";
      };

      "hyprland/language" = {
        format = "{}";
        tooltip = false;
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

      battery = {
        format = "󰂎 {capacity}%";
        format-full = "";
        format-charging = "󰢟 {capacity}%";
        format-warning = "󱃍 {capacity}%";
        format-urgent = "󱃍 {time}";
        states = {
          warning = 30;
          urgent = 15;
        };
        tooltip-format = "{time}, {power}W, {health}% max";
      };

      "custom/wlogout" = {
        format = "⏻";
        tooltip = false;
        on-click = "wlogout";
      };
    };
  };

  style = ./style.css;
}
