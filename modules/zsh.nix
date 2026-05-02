{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true; # enable zsh
    enableCompletion = true; # enable completion
    autosuggestion.enable = true; # enable autosuggestion
    syntaxHighlighting.enable = true; # enable syntax highlighting

    # aliases
    shellAliases = {
      ll = "ls -l"; # list files as list
      update = "sudo nixos-rebuild switch"; # rebuild
      hms = "nix run home-manager/master -- switch --flake ~/.config/home-manager -b backup"; # home-manager switch
      ytfzfm = "ytfzf -m -d --ytdl-opts='-x --audio-format mp3'"; # download mp3 from youtube by using ytfzf
      lg = "lazygit";
      ld = "lazydocker";
      vi = "nvim"; # old habits
      cd = "z"; # cd but better
      ".." = "cd ..";
      "..." = "cd ../..";
    };

    # history
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true; # enable oh my zsh
      plugins = ["git" "sudo" "docker" "fzf" "zoxide"]; # plugins
      theme = "robbyrussell"; # theme
    };

    initContent = ''
      bindkey '^[[1;5C' forward-word
      bindkey '^[[1;5D' backward-word
      fastfetch --config ~/.nix-profile/share/fastfetch/presets/examples/7.jsonc
    '';
  };
}
