{ pkgs, ... }:
{
  hardware.firmware = [
    pkgs.raspberrypiWirelessFirmware
  ];

  services.tailscale.enable = true;
}
