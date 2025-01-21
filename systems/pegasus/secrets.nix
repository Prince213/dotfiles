{ config, ... }:
{
  sops = {
    secrets = {
      psk-ShanghaiTech-IoT = { };
      ssh-port = { };
      root-password-hash = {
        neededForUsers = true;
      };
    };

    defaultSopsFile = ./secrets.yaml;

    templates.networkmanager.content = ''
      PSK_ShanghaiTech_IoT='${config.sops.placeholder.psk-ShanghaiTech-IoT}'
    '';

    templates.openssh.content = ''
      Port ${config.sops.placeholder.ssh-port}
    '';
  };
}
