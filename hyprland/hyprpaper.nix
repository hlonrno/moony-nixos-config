_:
let
  wallpaper = "~/.config/home-manager/hyprland/wallpaper.png";
in
{
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
