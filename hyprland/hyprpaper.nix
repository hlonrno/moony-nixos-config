let
  wallpaper = "~/.config/home-manager/hyprland/wallpaper.png";
in
{
  enable = true;
  settings = {
    ipc = "off";
    splash = false;
    preload = [ wallpaper ];
    wallpaper = [
      "eDP-1,${wallpaper}"
      ",${wallpaper}"
    ];
  };
}
