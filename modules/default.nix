{pkgs, ...}: {
  imports = [
    ./cursor.nix
    ./env.nix
    ./font.nix
    ./fuzzel.nix
    ./mako.nix
    ./ghostty.nix
    ./icons.nix
    ./hyprland.nix
    ./theme.nix
    ./nvim.nix
    ./waybar.nix
    ./zsh.nix
    ./git.nix
  ];
}
