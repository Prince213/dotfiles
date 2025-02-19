{ config, ... }:
{
  sops = {
    secrets = {
      root-password-hash = {
        neededForUsers = true;
      };
      psk-SUSTech_5G = { };
    };

    defaultSopsFile = ./secrets.yaml;

    templates.networkmanager.content = ''
      PSK_SUSTech_5G='${config.sops.placeholder.psk-SUSTech_5G}'
    '';
  };
}
