{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      package = pkgs.catppuccin-gtk;
      name = "catppuccin-frappe-blue-standard";
    };
  };
}
