{pkgs, ...}: {
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.catppuccin-cursors.latteDark;
    name = "Catppuccin Latte Dark";
    size = 16;
  };
}
