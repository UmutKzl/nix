{pkgs, ...}: {
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.latteDark;
    name = "Catppuccin Latte Dark";
    size = 16;
  };
}
