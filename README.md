# My Home-Manager config

My Home-Manager config to use in M2 MacBook Air.

## Installation

Add these to your `/etc/nixos/configuration.nix`

```nix
{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  networking.networkmanager.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
```

Don't forget to run a rebuild.

And clone the repo and rebuild

```bash
git clone https://github.com/UmutKzl/nix.git ~/.config/home-manager
nix run home-manager/master -- switch --flake ~/.config/home-manager
```
