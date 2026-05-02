{pkgs, ...}: {
  programs.gpg = {
    enable = true; # enable gpg
  };

  services.gpg-agent = {
    enable = true; # enable gpg agent
    pinentry.package = pkgs.pinentry-tty; # set pinentry package
  };
}
