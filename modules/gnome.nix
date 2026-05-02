{
  pkgs,
  lib,
  config,
  ...
}: let
  myWallpaper = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/orangci/walls-catppuccin-mocha/master/old-car.jpg";
    hash = "sha256-ozAEAlV05T/psmZ4oJuoHeFbju8ikpVnPc9BBjj+soQ=";
  }; # download wallpaper
in {
  home.packages = with pkgs; [
    gnomeExtensions.appindicator # tray icons
    gnomeExtensions.user-themes # user themes
    nerd-fonts.jetbrains-mono # font
    ulauncher # app launcher but better
    wmctrl # some dependency
  ];

  # start ulauncher
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
    # set theme
    theme = {
      name = "catppuccin-frappe-blue-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = ["blue"];
        variant = "frappe";
      };
    };

    # set icons
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
    # shortcuts
    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Super>q"];
      toggle-maximized = ["<Super>k"];
      minimize = ["<Super>j"];

      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-5 = ["<Super>5"];
      switch-to-workspace-6 = ["<Super>6"];
      switch-to-workspace-7 = ["<Super>7"];
      switch-to-workspace-8 = ["<Super>8"];
      switch-to-workspace-9 = ["<Super>9"];

      move-to-workspace-1 = ["<Super><Shift>1"];
      move-to-workspace-2 = ["<Super><Shift>2"];
      move-to-workspace-3 = ["<Super><Shift>3"];
      move-to-workspace-4 = ["<Super><Shift>4"];
      move-to-workspace-5 = ["<Super><Shift>5"];
      move-to-workspace-6 = ["<Super><Shift>6"];
      move-to-workspace-7 = ["<Super><Shift>7"];
      move-to-workspace-8 = ["<Super><Shift>8"];
      move-to-workspace-9 = ["<Super><Shift>9"];
    };

    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-5 = [];
      switch-to-application-6 = [];
      switch-to-application-7 = [];
      switch-to-application-8 = [];
      switch-to-application-9 = [];
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = ["<Super>h"];
      toggle-tiled-right = ["<Super>l"];
    };

    # set font
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      monospace-font-name = "JetBrainsMono Nerd Font 11";
      document-font-name = "JetBrainsMono Nerd Font 11";
      font-name = "JetBrainsMono Nerd Font 11";
    };

    # background
    "org/gnome/desktop/background" = {
      picture-uri = "file://${myWallpaper}";
      picture-uri-dark = "file://${myWallpaper}";
      picture-options = "zoom";
    };

    # touchpad settings
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
      tap-to-click = false;
    };

    # enable some experimental features
    "org/gnome/mutter" = {
      experimental-features = [
        "scale-monitor-framebuffer"
        "xwayland-native-scaling"
        "autoclose-xwayland"
      ];
    };

    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 9;
    };

    # custom shortcuts
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
      ];
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
