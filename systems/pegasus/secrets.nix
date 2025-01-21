{ config, ... }:
{
  sops = {
    secrets = {
      psk-ShanghaiTech-IoT = { };
      psk-TP-LINK_CD28 = { };
      ssh-port = { };
      root-password-hash = {
        neededForUsers = true;
      };
    };

    defaultSopsFile = ./secrets.yaml;

    templates.networkmanager.content = ''
      PSK_ShanghaiTech_IoT='${config.sops.placeholder.psk-ShanghaiTech-IoT}'
      PSK_TP_LINK_CD28='${config.sops.placeholder.psk-TP-LINK_CD28}'
    '';

    templates.openssh.content = ''
      Port ${config.sops.placeholder.ssh-port}
    '';
  };
}
