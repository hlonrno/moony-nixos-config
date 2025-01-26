# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }@inputs: {
  imports = [
      ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  networking.hostName = "nixos";
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

  services.xserver.enable = true;
  #services.displayManager.autoLogin = { enable = true; user = "moony"; };
  services.libinput.enable = false;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.printing.enable = true;

  hardware.bluetooth.enable = true;
  hardware.graphics.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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
  ];

  environment.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    HYPRCURSOR_THEME = "Bibata-Modern-Ice";
    HYPRCURSOR_SIZE = "24";
    PATH = [
      "/nix/store/gnf3mv68i5g6jmabnbbncsar3kbg13zd-gcc-14-20241116/bin"
    ];
  };

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    users.moony = import ./home.nix;
  };

  programs.hyprland = { enable = true; xwayland.enable = true; };
  programs.mtr.enable = true;
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  services.openssh.enable = true;
  services.flatpak.enable = true;

  networking.firewall.allowedTCPPorts = [ 83 443 22 21 ];
  networking.firewall.allowedUDPPorts = [ ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # https://nixos.org/nixos/options.html
  system.stateVersion = "24.11";
}
