{
  config,
  pkgs,
  lib,
  ...
}: {
  # Import Things
  imports = [
    ./modules
    ./packages.nix
  ];

  # Some things
  home = {
    username = lib.mkDefault "umutkzl";
    homeDirectory = lib.mkDefault "/home/umutkzl";
    stateVersion = "25.11";
    enableNixpkgsReleaseCheck = false;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Let Home-Manager manage itself
  programs.home-manager.enable = true;
}
