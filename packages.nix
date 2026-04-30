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
    lazygit
    lazydocker
    python3
    zoxide
    ffmpeg
    libva-utils
  ];
}
