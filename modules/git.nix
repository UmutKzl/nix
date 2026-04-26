{pkgs, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "UmutKzl";
        email = "umutkzl@protonmail.com";
      };
    };
  };
}
