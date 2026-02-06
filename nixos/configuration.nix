{ pkgs, latest, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  environment.systemPackages = with pkgs; [
    neovim
    tree
    unzip
    haruna
    loupe
    nautilus
    speedcrunch
    kitty
    ffmpeg
    file
    brightnessctl

    hyprcursor
    hyprpaper
    hyprshot
    hyprpicker
    hyprpolkitagent
    pavucontrol
    wl-clipboard
    wlogout
    bluez
    dunst
    jq
    libnotify
    libsForQt5.qt5ct
  ] ++ (with latest; [
    vivaldi
    vivaldi-ffmpeg-codecs
  ]);

  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  services = {
    xserver.enable = true;
    blueman.enable = true;
    openssh.enable = true;
    libinput.enable = false;
    pulseaudio.enable = false;

    kanata = {
      enable = true;
      keyboards.kb = {
        extraDefCfg = "process-unmapped-keys yes";
        config = builtins.readFile ./config.kbd;
      };
    };

    displayManager.autoLogin = {
      enable = true;
      user = "moony";
    };

    xserver.xkb = {
      layout = "us";
      variant = "";
    };
    
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  programs = {
    mtr.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 83 443 22 21 ];
    firewall.allowedUDPPorts = [ ];
  };

  hardware = {
    bluetooth.enable = true;
    graphics.enable = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  security.rtkit.enable = true;
  users.users.moony = {
    isNormalUser = true;
    description = "moony";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [];
  };

  time.timeZone = "Europe/Sofia";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "bg_BG.UTF-8";
    LC_IDENTIFICATION = "bg_BG.UTF-8";
    LC_MEASUREMENT = "bg_BG.UTF-8";
    LC_MONETARY = "bg_BG.UTF-8";
    LC_NAME = "bg_BG.UTF-8";
    LC_NUMERIC = "bg_BG.UTF-8";
    LC_PAPER = "bg_BG.UTF-8";
    LC_TELEPHONE = "bg_BG.UTF-8";
    LC_TIME = "bg_BG.UTF-8";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
