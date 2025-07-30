{
  description = "snowflake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { nixpkgs, nixpkgs-unstable, ... }: {
    nixosConfigurations.t = nixpkgs.lib.nixosSystem {
      specialArgs = { pkgs-unstable = nixpkgs-unstable; };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
