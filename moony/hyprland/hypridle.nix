{
  enable = true;
  settings = {
    general = {
      lock_cmd = "pidof hyprlock || hyprlock";
      before_sleep_cmd = "loginctl lock-session";
      after_sleep_cmd = "hyprctl dispatch dpms on";
    };

    listeners = [
      {
        timeout = 60;
        on-timeout = "brightnessctl -s s 15";
        on-resume = "brightnessctl -r";
      }
      {
        timeout = 5 * 60;
        on-timeout = "loginctl lock-session";
      }
      {
        timeout = 5.5 * 60;
        on-timeout = "hyprctl dispatch dpms off";
        on-resume = "hyprctl dispatch dpms on";
      }
      {
        timeout = 8 * 60;
        on-timeout = "systemctl suspend";
      }
    ];
  };
}

