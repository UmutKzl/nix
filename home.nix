{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./modules
    ./packages.nix
  ];

  home = {
    username = lib.mkDefault "umutkzl";
    homeDirectory = lib.mkDefault "/home/umutkzl";
    stateVersion = "25.11";
    enableNixpkgsReleaseCheck = false;
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
