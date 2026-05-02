{pkgs, ...}: {
  programs.ghostty = {
    enable = true; # enable ghostty

    settings = {
      theme = "Catppuccin Mocha"; # set theme
      background-opacity = 0.9; # set background opacity
      font-size = 12; # set font size
      command = "${pkgs.zsh}/bin/zsh"; # set default shell zsh
      window-padding-x = 10; # leave space in x
      window-padding-y = 10; # leave space in y
      cursor-style = "block"; # cursor style
      cursor-style-blink = true; # enable cursor blinking
      shell-integration-features = "no-cursor"; # don't let shell manage your cursor
    };
  };
}
