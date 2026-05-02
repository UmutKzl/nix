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
        "nix.formatterPath" = "alejandra"; # set nix formatter
        "workbench.colorTheme" = "Catppuccin Mocha"; # set theme
        "catppuccin.accentColor" = "blue"; # set accent color

        # keybindings
        "vim.normalModeKeyBindingsNonRecursive" = [
          {
            # file picker
            before = ["<Space>" "f" "f"];
            commands = ["workbench.action.quickOpen"];
          }

          {
            # commander
            before = ["<Space>" "p"];
            commands = ["workbench.action.showCommands"];
          }

          {
            # format
            before = ["<Space>" "f" "m"];
            commands = ["workbench.action.formatDocument"];
          }

          {
            # which-key
            before = ["\\"];
            commands = ["whichkey.show"];
          }
        ];
      };
    };
  };
}
