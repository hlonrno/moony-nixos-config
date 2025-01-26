{ config, pkgs, ... }: {  
  home.stateVersion = "24.11";
  home.homeDirectory = "/home/moony";
  home.sessionVariables.EDITOR = "nvim";

  home.packages = with pkgs; [
    obs-studio
    blender
    vesktop
    radeontop
    hyprpaper
    hyprcursor
    hyprshot
    bibata-cursors
  ];

  wayland.windowManager.hyprland = import ./hyprland/hyprland.nix;
  services.hyprpaper = import ./hyprland/hyprpaper.nix;
  home.file = import ./files/main.nix;

  programs = {
    neovim = import ./neovim/nvim.nix { inherit pkgs; };
    waybar = import ./waybar/waybar.nix;
    kitty = import ./kitty/kitty.nix;
    gh = import ./git/gh.nix;

    git-credential-oauth.enable = true;
    bash.enable = true;
    git.enable = true;
    home-manager.enable = true;
  };
}
