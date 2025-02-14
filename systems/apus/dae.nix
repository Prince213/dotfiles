{ config, ... }:
{
  services.dae = {
    enable = true;
    openFirewall = {
      enable = true;
      port = 12345;
    };
    configFile = config.sops.secrets.dae.path;
  };
}
