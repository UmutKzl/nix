{pkgs, ...}: let
  myWallpaper = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/orangci/walls-catppuccin-mocha/master/old-car.jpg";
    hash = "sha256-ozAEAlV05T/psmZ4oJuoHeFbju8ikpVnPc9BBjj+soQ=";
  };
in {
  home.packages = with pkgs; [catppuccin-kde kdePackages.krohnkite]; # install theme and scripts

  programs.plasma = {
    enable = true;

    fonts = {
      general = {
        family = "JetBrainsMono Nerd Font";
        pointSize = 11;
      };
      fixedWidth = {
        family = "JetBrainsMono Nerd Font";
        pointSize = 10;
      };
      menu = {
        family = "JetBrainsMono Nerd Font";
        pointSize = 10;
      };
      toolbar = {
        family = "JetBrainsMono Nerd Font";
        pointSize = 10;
      };
      small = {
        family = "JetBrainsMono Nerd Font";
        pointSize = 8;
      };
      windowTitle = {
        family = "JetBrainsMono Nerd Font";
        pointSize = 10;
      };
    };

    workspace = {
      clickItemTo = "open"; # one click to open, not select
      windowDecorations = {
        library = "org.kde.breeze";
        theme = "Breeze";
      };
      wallpaper = "${myWallpaper}"; # set wallpaper
    };

    kwin.virtualDesktops = {
      number = 6; # 6 virtual desktops
    };

    configFile."kwinrc"."Plugins"."krohnkiteEnabled" = true; # enable tiling

    configFile."kdeglobals"."KDE"."AnimationDurationFactor" = 0.5; # speed up animations

    configFile."kwinrc"."Windows"."FocusPolicy" = "FocusFollowsMouse"; # enable focus follows mouse

    shortcuts = {
      "kwin" = {
        "Overview" = "none";

        "Window Close" = "Meta+Q";
        "Window Maximize" = "Meta+W";

        # "Window Quick Tile Left" = "Meta+H";
        # "Window Quick Tile Bottom" = "Meta+J";
        # "Window Quick Tile Top" = "Meta+K";
        # "Window Quick Tile Right" = "Meta+L";

        "KrohnkiteFocusLeft" = "Meta+H";
        "KrohnkiteFocusDown" = "Meta+J";
        "KrohnkiteFocusUp" = "Meta+K";
        "KrohnkiteFocusRight" = "Meta+L";

        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch to Desktop 5" = "Meta+5";
        "Switch to Desktop 6" = "Meta+6";
        "Switch to Desktop 7" = "Meta+7";
        "Switch to Desktop 8" = "Meta+8";
        "Switch to Desktop 9" = "Meta+9";

        "Window to Desktop 1" = "Meta+!";
        "Window to Desktop 2" = "Meta+@";
        "Window to Desktop 3" = "Meta+#";
        "Window to Desktop 4" = "Meta+$";
        "Window to Desktop 5" = "Meta+ %";
        "Window to Desktop 6" = "Meta+^";
        "Window to Desktop 7" = "Meta+&";
        "Window to Desktop 8" = "Meta+*";
        "Window to Desktop 9" = "Meta+(";
      };
      "ksmserver" = {
        "Lock Session" = "Ctrl+Meta+Q";
      };
      "services/com.mitchellh.ghostty.desktop" = {
        "_launch" = "Meta+Return";
      };
      "org.kde.spectacle.desktop" = {
        "RectangularRegionScreenShot" = "Meta+Shift+S";
      };
    };

    krunner = {
      position = "center";
      shortcuts.launch = "Meta+R";
    };

    window-rules = [
      {
        description = "Remove Titlebar";
        match = {
          window-class = {
            value = ".*";
            type = "regex";
          };
        };
        apply = {
          noborder = {
            value = true;
            apply = "force";
          };
        };
      }
    ];

    input = {
      touchpads = [
        {
          enable = true;
          name = "Apple MTP multi-touch";
          productId = "0351";
          vendorId = "05ac";
          middleButtonEmulation = true; # three finger press to middle click
          naturalScroll = false; # disable natural scroll
          tapToClick = false; # disable tap to click, I want to press
        }
      ];
    };

    panels = [
      {
        location = "top";
        floating = false;
        alignment = "center";
        lengthMode = "fill";
        widgets = [
          # "org.kde.plasma.kickoff"
          # {
          # name = "org.kde.plasma.icontasks";
          # config = {
          #   General = {
          # launchers = [
          #   "applications:com.mitchellh.ghostty.desktop"
          #   "applications:org.kde.dolphin.desktop"
          #   "applications:firefox.desktop"
          # ];
          # };
          # };
          # }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.pager"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
    ];
  };
}
