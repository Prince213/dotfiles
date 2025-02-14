{ config, ... }:
{
  services.dae = {
    enable = true;
    configFile = config.sops.secrets.dae.path;
  };
}
