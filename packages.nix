{pkgs, ...}: {
  home.packages = with pkgs; [
    wget
    ghostty
    nerd-fonts.jetbrains-mono
    grimblast
    libnotify
    alejandra
    pcmanfm
    nixd
    ripgrep
    fastfetch
    swayosd
    fzf
    asahi-bless
    localsend
    lazygit
  ];
}
