{
  config,
  pkgs,
  ...
}: let
  nixvim = import (
    builtins.fetchGit {
      url = "https://github.com/nix-community/nixvim";
    }
  );
in {
  imports = [
    nixvim.homeModules.nixvim

    ./modules
    ./packages.nix
  ];

  home.username = "umutkzl";
  home.homeDirectory = "/home/umutkzl";
  home.stateVersion = "25.11";
  home.enableNixpkgsReleaseCheck = false;

  programs.home-manager.enable = true;
}
