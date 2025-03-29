{
  description = "snowflake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pgks = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations.t = nixpkgs.lib.nixosSystem {
      modules = [
        ./moony/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
