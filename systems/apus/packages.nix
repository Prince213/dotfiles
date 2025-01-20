{ lib, pkgs, ... }:
{
  hardware.bluetooth.enable = true;

  programs.kde-pim = {
    enable = true;
    merkuro = true;
  };

  virtualisation.podman.enable = true;

  programs.steam.enable = true;

  services.tailscale.enable = true;

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    docker-client
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
    ];
}
