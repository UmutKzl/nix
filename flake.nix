{
  description = "UmutKzl's Home Manager config";

  inputs = {
    nixpkgs.url = "github:nix-community/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "aarch64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."umutkzl" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [./home.nix];
    };
  };
}
