{ lib, pkgs, ... }:
{
  hardware.enableRedistributableFirmware = true;

  hardware.bluetooth.enable = true;

  programs.kde-pim = {
    enable = true;
    merkuro = true;
  };

  services.power-profiles-daemon.enable = false;

  programs.steam.enable = true;

  services.tailscale.enable = true;

  services.tlp.enable = true;

  programs.zsh.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];

  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kate
    khelpcenter
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "google-chrome"
      "mccgdi"
      "steam"
      "steam-unwrapped"
    ];
}
