{ config, pkgs, ... }: {  
  home.stateVersion = "24.11";
  home.homeDirectory = "/home/moony";
  home.sessionVariables.EDITOR = "nvim";

  wayland.windowManager.hyprland = import ./hyprland/hyprland.nix;
  home.file = import ./files/main.nix;

  services = {
    hyprpaper = import ./hyprland/hyprpaper.nix;
    hypridle = import ./hyprland/hypridle.nix;
  };

  programs = {
    neovim = import ./nvim/nvim.nix { inherit pkgs; };
    waybar = import ./waybar/waybar.nix;
    kitty = import ./kitty/kitty.nix;
    gh = import ./gh.nix;
    hyprlock = import ./hyprland/hyprlock.nix;
    wofi = import ./wofi/wofi.nix;
    fastfetch = import ./fastfetch.nix;

    git-credential-oauth.enable = true;
    zoxide.enable = true;
    bash.enable = true;
    git.enable = true;
    home-manager.enable = true;
  };
}
