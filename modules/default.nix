{pkgs, ...}: {
  imports = [
    ./env.nix
    ./font.nix
    ./fuzzel.nix
    ./ghostty.nix
    ./nvim.nix
    ./plasma.nix
    ./zsh.nix
    ./git.nix
    # ./mako.nix
    # ./cursor.nix
    # ./icons.nix
    # ./hyprland.nix
    # ./waybar.nix
    # ./theme.nix
  ];
}
