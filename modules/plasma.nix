{pkgs, ...}: {
  programs.plasma = {
    enable = true;
    workspace = {
      clickItemTo = "open";
      lookAndFeel = "org.kde.breezedark.desktop";
      # wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/contents/images_dark/5120x2880.jpg";
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Mountain/contents/images/mountain.jpg";
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
      }
    ];
  };
}
