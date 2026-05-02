{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        dracula-theme.theme-dracula
        vscodevim.vim
        ms-python.python
        ms-vscode.live-server
        jnoortheen.nix-ide
      ];
      userSettings = {
        "nix.formatterPath" = "alejandra";
      };
    };
  };
}
