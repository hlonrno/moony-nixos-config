{ config, pkgs, ... }: {  
  home.stateVersion = "24.11";
  home.homeDirectory = "/home/moony";

  home.packages = with pkgs; [
    jdt-language-server
    nixd
    zls
    lua-language-server
    clang-tools
    marksman
  ];

  wayland.windowManager.hyprland = import ./hypr.nix;

  programs = {
    neovim = (import ./nvim/nvim.nix){ inherit pkgs; };
    waybar = import ./waybar.nix;

    git-credential-oauth.enable = true;
    bash.enable = true;
    kitty.enable = true;
    git.enable = true;

    gh = {
      enable = true;
      gitCredentialHelper.hosts = [ "https://github.com" ];

      settings = {
        git_protocol = "https";
        prompt = "true";

        aliases = {
          pc = "pr checkout";
          pv = "pr view";
        };
      };
    };
  };
}
