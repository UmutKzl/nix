{pkgs, ...}: {
  home.packages = with pkgs; [
    opencode # add opencode
  ];
  services.ollama = {
    enable = true; # enable ollama
  };
}
