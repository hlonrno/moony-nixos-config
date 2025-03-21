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
    nushell = import ./nushell.nix;
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
    };

    git-credential-oauth.enable = true;
    bash.enable = true;
    bash.bashrcExtra = "nu";
    git.enable = true;
    home-manager.enable = true;
  };
}
