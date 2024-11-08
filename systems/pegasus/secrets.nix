{ config, ... }:
{
  sops = {
    secrets = {
      psk-ShanghaiTech-IoT = { };
    };

    defaultSopsFile = ./secrets.yaml;

    templates.networkmanager.content = ''
      PSK_ShanghaiTech_IoT='${config.sops.placeholder.psk-ShanghaiTech-IoT}'
    '';
  };
}
