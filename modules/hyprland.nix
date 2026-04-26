{pkgs, ...}: let
  myWallpaper = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/orangci/walls-catppuccin-mocha/master/old-car.jpg";
    hash = "sha256-ozAEAlV05T/psmZ4oJuoHeFbju8ikpVnPc9BBjj+soQ=";
  };
in {
  home.packages = [pkgs.swaybg];
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
}
