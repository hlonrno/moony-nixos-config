{
  description = "A Snowie.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-latest.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { lib, nixpkgs, nixpkgs-latest, nixpkgs-unstable, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    latest = import nixpkgs-latest magic;
    unstable = import nixpkgs-unstable magic;
    magic = {
      inherit system;
      config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "vivaldi"
        "vivaldi-ffmpeg-codecs"
      ];
    };
  in
  {

    nixosConfigurations.moony = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit unstable; inherit latest; };
      modules = [ ./nixos/configuration.nix ];
    };

    homeConfigurations.moony = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit unstable; inherit latest; };
      modules = [ ./home.nix ];
    };
  };
}
