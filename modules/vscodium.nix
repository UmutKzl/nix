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
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        vspacecode.whichkey
      ];
      userSettings = {
        "nix.formatterPath" = "alejandra";
        "workbench.colorTheme" = "Catppuccin Mocha";
        "catppuccin.accentColor" = "blue";

        "vim.normalModeKeyBindingsNonRecursive" = [
          {
            before = ["<Space>" "f" "f"];
            commands = ["workbench.action.quickOpen"];
          }

          {
            before = ["<Space>" "p"];
            commands = ["workbench.action.showCommands"];
          }

          {
            before = ["<Space>" "f" "m"];
            commands = ["workbench.action.formatDocument"];
          }

          {
            before = ["\\"];
            commands = ["whichkey.show"];
          }
        ];
      };
    };
  };
}
