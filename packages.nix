{pkgs, ...}: {
  home.packages = with pkgs; [
    wget
    ghostty
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
