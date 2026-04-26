{pkgs, ...}: {
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "Catppuccin Mocha";
      background-opacity = 0.9;
      font-size = 12;
      command = "${pkgs.zsh}/bin/zsh";
      window-padding-x = 10;
      window-padding-y = 10;
    };
  };
}
