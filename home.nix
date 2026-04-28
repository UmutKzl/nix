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

  home.username = lib.mkDefault "umutkzl";
  home.homeDirectory = lib.mkDefault "/home/umutkzl";
  home.stateVersion = "25.11";
  home.enableNixpkgsReleaseCheck = false;

  programs.home-manager.enable = true;
}
