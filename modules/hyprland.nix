{pkgs, ...}: let
  myWallpaper = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/orangci/walls-catppuccin-mocha/master/old-car.jpg";
    hash = "sha256-ozAEAlV05T/psmZ4oJuoHeFbju8ikpVnPc9BBjj+soQ=";
  };
in {
  home.packages = with pkgs; [swaybg nerd-fonts.jetbrains-mono noto-fonts noto-fonts-cjk-sans liberation_ttf];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      exec-once = ["waybar" "hyprpaper" "swayosd-server" "swaybg -i ${myWallpaper} -m fill" "mako"];

      monitor = ", preferred, auto, 1.6";

      animations = {
        enabled = true;
        bezier = [
          "fluent_curve, 0.0, 0.0, 0.2, 1.0"
          "fast, 0, 1.1, 0.1, 1.1"
        ];
        animation = [
          "windows, 1, 3, fluent_curve"
          "windowsOut, 1, 3, fast, popin 80%"
          "border, 1, 3, default"
          "fade, 1, 3, default"
          "workspaces, 1, 3.5, fluent_curve, slide"
        ];
      };

      input = {
        touchpad = {
          tap-to-click = false;
          natural_scroll = false;
          clickfinger_behavior = true;
        };
      };

      binde = [
        ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise --max-volume 80"
        ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower --max-volume 80"

        ", XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
        ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
      ];

      bind =
        [
          "$mod, f, exec, firefox"
          "$mod shift, s, exec, grimblast copy area"
          "$mod, q, killactive"
          "$mod, return, exec, ghostty"
          "$mod, space, exec, fuzzel"
          "$mod, v, togglefloating"
          "$mod, h, movefocus, l"
          "$mod, j, movefocus, d"
          "$mod, k, movefocus, u"
          "$mod, l, movefocus, r"
          "$mod shift, h, movewindow, l"
          "$mod shift, j, movewindow, d"
          "$mod shift, k, movewindow, u"
          "$mod shift, l, movewindow, r"

          ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
          ", XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
          ", XF86AudioPlay, exec, swayosd-client --playerctl play-pause"
          ", XF86AudioNext, exec, swayosd-client --playerctl next"
          ", XF86AudioPrev, exec, swayosd-client --playerctl previous"
        ]
        ++ (builtins.concatLists (
          builtins.genList (
            i: let
              ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9
        ));

      bindr = [
        "CAPS, Caps_Lock, exec, swayosd-client --caps-lock"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 38;
        modules-left = ["hyprland/workspaces"];
        modules-right = ["battery" "clock" "tray"];
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };
        "clock" = {
          format = "{:%H:%M}   ";
          format-alt = "{:%A, %B %d, %Y}  ";
        };
        "battery" = {
          format = "{capacity}% {icon}  ";
          format-icons = [" " " " " " " " " "];
        };
      };
    };
    style = ''
      * {
        border: none;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
      }
      window#waybar {
        background: rgba(43, 48, 59, 0.5);
        color: #ffffff;
      }
      #workspaces button {
        padding: 0 5px;
        background: transparent;
        color: white;
      }
      #workspaces button.active {
        background: #64727D;
        border-bottom: 3px solid #ffffff;
      }
    '';
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${pkgs.ghostty}/bin/ghostty";
        layer = "overlay";
      };

      colors = {
        background = "1e1e2edd";
        text = "cdd6f4ff";
        prompt = "bac2deff";
        placeholder = "7f849cff";
        input = "cdd6f4ff";
        match = "89b4faff";
        selection = "585b70ff";
        selection-text = "cdd6f4ff";
        selection-match = "89b4faff";
        counter = "7f849cff";
        border = "89b4faff";
      };

      border = {
        width = 2;
        radius = 10;
      };
    };
  };

  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };

    iconTheme = {
      package = pkgs.catppuccin-papirus-folders;
      name = "Papirus-Dark";
    };

    theme = {
      package = pkgs.catppuccin-gtk;
      name = "catppuccin-frappe-blue-standard";
    };
  };

  services.mako = {
    enable = true;
    settings = {
      background-color = "#1e1e2e";
      text-color = "#cdd6f4";
      border-color = "#89b4fa";
      progress-color = "over #313244";
    };
    extraConfig = ''
      [urgency=high]
      border-color=#fab387
    '';
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.latteDark;
    name = "Catppuccin Latte Dark";
    size = 16;
  };
}
