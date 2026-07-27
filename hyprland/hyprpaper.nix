_:
let
  wallpaper = toString ./wallpaper.png;
in
{
  settings = {
    ipc = "off";
    splash = false;
    wallpaper = [
      ''{
        monitor = eDP-1
        path = ${wallpaper}
        fit_mode = cover
      }''
      ''{
        monitor =
        path = ${wallpaper}
        fit_mode = cover
      }''
    ];
  };
}
