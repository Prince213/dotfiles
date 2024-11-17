{ config, ... }:
{
  sops = {
    secrets = {
      psk-SUSTech_5G = { };
    };

    defaultSopsFile = ./secrets.yaml;

    templates.networkmanager.content = ''
      PSK_SUSTech_5G='${config.sops.placeholder.psk-SUSTech_5G}'
    '';
  };
}
