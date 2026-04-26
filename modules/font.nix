{pkgs, ...}: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [nerd-fonts.jetbrains-mono noto-fonts noto-fonts-cjk-sans liberation_ttf];
  gtk = {
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };
  };
}
