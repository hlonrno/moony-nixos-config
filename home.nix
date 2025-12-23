{pkgs, pkgs-unstable, ... }:
{
  home.stateVersion = "25.05";
  home.homeDirectory = "/home/moony";
  home.username = "moony";
  home.file = import ./files/main.nix;
  home.sessionVariables.EDITOR = "nvim";

  home.packages = with pkgs; [
    blender
    ffmpeg
    file
    krita
    radeontop
    tree
    unzip
    lorien
    gnumake
    bibata-cursors
    vesktop
  ];

  wayland.windowManager.hyprland = import ./hyprland/hyprland.nix { inherit pkgs; };
  services.hyprpaper = import ./hyprland/hyprpaper.nix;

  programs = {
    neovim = import ./nvim/nvim.nix { inherit pkgs; };
    tmux = import ./tmux/tmux.nix { inherit pkgs; };
    waybar = import ./waybar/waybar.nix;
    kitty = import ./kitty/kitty.nix;
    hyprlock = import ./hyprland/hyprlock.nix;
    tofi = import ./tofi.nix;
    gh = import ./gh.nix;
    fastfetch = import ./fastfetch.nix;
    bash = import ./bash.nix;

    fzf = {
      enable = true;
      # enableBashIntergation = true;
    };

    git = {
      enable = true;
      userEmail = "moony25@proton.me";
      userName = "hlonrno";
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };

    java = {
      enable = true;
      # no jdk25 on nixpkgs-25.05;
      package = pkgs-unstable.jdk25;
    };

    obs-studio.enable = true;
    bashmount.enable = true;
    home-manager.enable = true;
  };
}
