{ pkgs, latest, ... }:
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
    btop
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

  wayland.windowManager.hyprland = import ./hyprland/hyprland.nix { inherit pkgs; };
  services.hyprpaper = import ./hyprland/hyprpaper.nix;

  programs = {
    neovim = import ./nvim/nvim.nix { inherit pkgs; };
    tmux = import ./tmux/tmux.nix { inherit pkgs; };
    emacs = import ./emacs/emacs.nix { inherit pkgs; };
    waybar = import ./waybar/waybar.nix;
    kitty = import ./kitty/kitty.nix;
    hyprlock = import ./hyprland/hyprlock.nix;
    tofi = import ./tofi.nix;
    gh = import ./gh.nix;
    fastfetch = import ./fastfetch.nix;
    bash = import ./bash.nix;

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
