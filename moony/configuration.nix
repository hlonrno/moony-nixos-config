{ config, pkgs, ... }@inputs: {
  imports = [
      ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    networkmanager.enable = true;
    hostName = "nixos";
    firewall.allowedTCPPorts = [ 83 443 22 21 ];
    firewall.allowedUDPPorts = [ ];
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

  services = {
    libinput.enable = false;
    pulseaudio.enable = false;
    xserver.enable = true;
    printing.enable = true;
    blueman.enable = true;
    openssh.enable = true;
    flatpak.enable = true;
    
    displayManager.autoLogin = { enable = true; user = "moony"; };

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
  
  hardware = {
    bluetooth.enable = true;
    graphics.enable = true;
  };

  security.rtkit.enable = true;

  users.users.moony = {
    isNormalUser = true;
    description = "Moony";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [];
  };

  environment.systemPackages = with pkgs; [
    vivaldi
    wl-clipboard
    libnotify
    dunst
    speedcrunch
    libsForQt5.qt5ct
    ffmpeg
    mtpfs
    nautilus
    haruna
    wofi
    wofi-emoji
    wlogout
    pavucontrol
    fastfetch
    brightnessctl
    loupe
    jdk23
    libgcc
    unzip
    tree
    font-awesome
    bluez
    gcc
  ];

  environment.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    users.moony = import ./home.nix;
  };

  programs = {
    hyprland = { enable = true; xwayland.enable = true; };
    mtr.enable = true;
    gnupg.agent = { enable = true; enableSSHSupport = true; };
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # https://nixos.org/nixos/options.html
  system.stateVersion = "24.11";
}
