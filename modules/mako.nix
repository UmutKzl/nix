{pkgs, ...}: {
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
}
