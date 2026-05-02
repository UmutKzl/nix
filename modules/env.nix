{pkgs, ...}: {
  home.sessionVariables = {
    # Make neovim default editor
    EDITOR = "nvim";
  };
}
