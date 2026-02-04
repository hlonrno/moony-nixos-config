{
  description = "Home Manager configuration of moony";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-latest.url = "github:nixos/nixpkgs/nixos-25.11";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixpkgs-unstable, nixpkgs-latest, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
      pkgs-latest = nixpkgs-latest.legacyPackages.${system};
    in {
      homeConfigurations.moony = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit pkgs-unstable; inherit pkgs-latest; };
        modules = [ ./home.nix ];
      };
    };
}
