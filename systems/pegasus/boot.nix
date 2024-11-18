{ pkgs, ... }:
{
  boot.loader.systemd-boot.configurationLimit = 3;
}
