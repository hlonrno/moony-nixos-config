{ pkgs, pkgs-unstable, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    neovim
    haruna
    loupe
    nautilus
    speedcrunch
    kitty

    bibata-cursors
    brightnessctl
    hyprcursor
    hyprpaper
    hyprshot
    hyprpicker
    hyprpolkitagent
    pavucontrol
    wl-clipboard
    wofi
    wofi-emoji
    wlogout
    bluez
    dunst
    jq
    libnotify
    libsForQt5.qt5ct
  ] ++ (with pkgs-unstable; [
    vivaldi vivaldi-ffmpeg-codecs
  ]);

  services = {
    xserver.enable = true;
    printing.enable = true;
    blueman.enable = true;
    openssh.enable = true;
    flatpak.enable = true;
    libinput.enable = false;
    pulseaudio.enable = false;

    displayManager.autoLogin = {
      enable = true;
      user = "moony";
    };

    xserver.videoDrivers = [ "amdgpu" ];
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

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  security.rtkit.enable = true;
  users.users.moony = {
    isNormalUser = true;
    description = "Moony";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [ ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
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

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
}
