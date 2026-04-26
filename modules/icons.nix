{pkgs, ...}: {
  gtk = {
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders;
      name = "Papirus-Dark";
    };
  };
}
