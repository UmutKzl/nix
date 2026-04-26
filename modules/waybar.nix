{pkgs, ...}: {
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
}
