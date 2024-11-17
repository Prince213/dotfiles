{ config, ... }:
{
  networking.networkmanager = {
    enable = true;
    ensureProfiles = {
      environmentFiles = [ config.sops.templates.networkmanager.path ];
    };
  };
}
