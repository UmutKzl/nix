{pkgs, ...}: {
  home.packages = [pkgs.catppuccin-kde]; # install catppuccin

  programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "open";
      cursor.theme = "Catppuccin-Frappe-Blue-Cursors";
      windowDecorations = {
        library = "org.kde.breeze";
        theme = "Breeze";
      };
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/contents/images/mountain.jpg";
    };

    kwin.virtualDesktops = {
      number = 10;
    };

    shortcuts = {
      "kwin" = {
        "Overview" = "none";

        "Window Close" = "Meta+Q";
        "Window Maximize" = "Meta+W";

        "Window Quick Tile Left" = "Meta+H";
        "Window Quick Tile Bottom" = "Meta+J";
        "Window Quick Tile Top" = "Meta+K";
        "Window Quick Tile Right" = "Meta+L";

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
      "org.kde.krunner.desktop" = {
        "_launch" = "Meta+Space";
      };
      "services/com.mitchellh.ghostty.desktop" = {
        "_launch" = "Meta+Return";
      };
      "org.kde.spectacle.desktop" = {
        "RectangularRegionScreenShot" = "Meta+Shift+S";
      };
    };

    input = {
      touchpads = [
        {
          enable = true;
          name = "Apple MTP multi-touch";
          productId = "0351";
          vendorId = "05ac";
          middleButtonEmulation = true;
          naturalScroll = false;
          tapToClick = false;
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
          "org.kde.plasma.kickoff"
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General = {
                launchers = [
                  "applications:com.mitchellh.ghostty.desktop"
                  "applications:org.kde.dolphin.desktop"
                  "applications:firefox.desktop"
                ];
              };
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.pager"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
    ];
  };
}
