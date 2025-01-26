{ config, pkgs, ... }: {  
  home.stateVersion = "24.11";
  home.homeDirectory = "/home/moony";
  
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    obs-studio
    blender
    vesktop
    radeontop
    hyprpaper
  ];

  wayland.windowManager.hyprland = import ./hypr.nix;
  services.hyprpaper = import ./hyprpaper.nix;

  home.file = {
    ".config/haruna/haruna.conf".text = ''
      [Audio]
      Volume=70

      [General]
      ColorScheme=Breeze Dark
      GuiStyle=Breeze
      UseBreezeIconTheme=true
    '';
  };
  

  programs = {
    neovim = (import ./nvim/nvim.nix){ inherit pkgs; };
    waybar = import ./waybar.nix;
  
    home-manager.enable = true;
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
