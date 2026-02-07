{ pkgs, latest, ... }:
let
  enable = a: a // { enabled = true; };
  # disable = a: a // { enabled = false; };
in
{
  home.stateVersion = "25.05";
  home.homeDirectory = "/home/moony";
  home.username = "moony";
  home.file = import ./files/main.nix;
  home.sessionVariables = {
    EDITOR = "nvim";
    H2 = "$HOME/home";
  };

  home.packages = with pkgs; [
    radeontop
    # gnumake
    htop
    ghc
    fzf
    wofi-emoji
    bibata-cursors
    # blender
    # krita
    # lorien
    vesktop
    woomer
    zeal
  ];

  wayland.windowManager.hyprland = enable (import ./hyprland/hyprland.nix pkgs);
  services.hyprpaper             = enable (import ./hyprland/hyprpaper.nix pkgs);

  programs = {
    neovim    = enable (import ./nvim/nvim.nix pkgs);
    tmux      = enable (import ./tmux/tmux.nix pkgs);
    emacs     = enable (import ./emacs/emacs.nix pkgs);
    waybar    = enable (import ./waybar/waybar.nix pkgs);
    kitty     = enable (import ./kitty/kitty.nix pkgs);
    hyprlock  = enable (import ./hyprland/hyprlock.nix pkgs);
    tofi      = enable (import ./single/tofi.nix);
    gh        = enable (import ./single/gh.nix);
    fastfetch = enable (import ./single/fastfetch.nix);
    bash      = enable (import ./single/bash.nix);

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
      package = latest.jdk25;
    };

    obs-studio.enable = true;
    bashmount.enable = true;
    home-manager.enable = true;
  };
}
