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

  outputs = { nixpkgs, nixpkgs-latest, nixpkgs-unstable, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    latest = nixpkgs-latest.legacyPackages.${system};
    unstable = nixpkgs-unstable.legacyPackages.${system};
  in
  {

    nixosConfigurations.moony = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
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
