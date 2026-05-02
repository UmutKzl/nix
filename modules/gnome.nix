{
  pkgs,
  lib,
  config,
  ...
}: let
  myWallpaper = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/orangci/walls-catppuccin-mocha/master/old-car.jpg";
    hash = "sha256-ozAEAlV05T/psmZ4oJuoHeFbju8ikpVnPc9BBjj+soQ=";
  };
in {
  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.user-themes
    nerd-fonts.jetbrains-mono
    ulauncher
    wmctrl
  ];

  systemd.user.services.ulauncher = {
    Unit = {
      Description = "Ulauncher";
      WantedBy = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.ulauncher}/bin/ulauncher --hide-window";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };

  gtk = {
    enable = true;
    gtk4.theme = config.gtk.theme;
    theme = {
      name = "catppuccin-frappe-blue-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = ["blue"];
        variant = "frappe";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "frappe";
        accent = "blue";
      };
    };
  };

  xdg.configFile = {
    "gtk-4.0/gtk.css".text = ''
      @import url("file://${pkgs.catppuccin-gtk.override {
        accents = ["blue"];
        variant = "frappe";
      }}/share/themes/catppuccin-frappe-blue-standard/gtk-4.0/gtk.css");
    '';
  };

  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Super>q"];
      toggle-maximized = ["<Super>k"];
      minimize = ["<Super>j"];
    };
    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = ["<Super>h"];
      toggle-tiled-right = ["<Super>l"];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      monospace-font-name = "JetBrainsMono Nerd Font 11";
      document-font-name = "JetBrainsMono Nerd Font 11";
      font-name = "JetBrainsMono Nerd Font 11";
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file://${myWallpaper}";
      picture-uri-dark = "file://${myWallpaper}";
      picture-options = "zoom";
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
      tap-to-click = false;
    };
    "org/gnome/mutter" = {
      experimental-features = [
        "scale-monitor-framebuffer"
        "xwayland-native-scaling"
        "autoclose-xwayland"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Launch Ghostty";
      command = "ghostty";
      binding = "<Super>Return";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Launch Ulauncher";
      command = "ulauncher-toggle";
      binding = "<Super>r";
    };
  };
}
