{pkgs, ...}: {
  imports = [
    ./env.nix
    ./ghostty.nix
    ./nvim.nix
    ./vscodium.nix
    ./zsh.nix
    ./git.nix
    ./ollama.nix
    ./gnupg.nix
    ./gnome.nix
    # ./plasma.nix
    # ./hyprland.nix
  ];
}
