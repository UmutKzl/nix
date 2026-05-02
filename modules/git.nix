{pkgs, ...}: {
  programs.git = {
    enable = true; # enable git
    settings = {
      user = {
        name = "UmutKzl"; # set username
        email = "umutkzl@protonmail.com"; # set mail
      };
    };
  };
}
