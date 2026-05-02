{pkgs, ...}: {
  imports = [
    # Editors
    ./nvim.nix
    ./vscodium.nix

    # Shell, environment, terminal and cli apps
    ./zsh.nix
    ./env.nix
    ./ghostty.nix
    ./git.nix
    ./ollama.nix
    ./gnupg.nix

    # Desktops, WM's...
    # If you want to change this, change it in /etc/nixos/configuration.nix too.
    ./gnome.nix
    # ./plasma.nix
    # ./hyprland.nix
  ];
}
