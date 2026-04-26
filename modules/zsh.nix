{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
      hms = "home-manager switch";
      vi = "nvim";
      ".." = "cd ..";
      "..." = "cd ../..";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "sudo" "docker" "fzf"];
      theme = "robbyrussell";
    };

    initContent = ''
      bindkey '^[[1;5C' forward-word
      bindkey '^[[1;5D' backward-word
      fastfetch --config ~/.nix-profile/share/fastfetch/presets/examples/7.jsonc
    '';
  };
}
