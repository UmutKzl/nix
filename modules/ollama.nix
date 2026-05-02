{pkgs, ...}: {
  home.packages = with pkgs; [
    opencode
  ];
  services.ollama = {
    enable = true;
  };
}
