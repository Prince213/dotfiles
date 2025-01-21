{ config, ... }:
{
  sops = {
    secrets = {
      psk-SUSTech_5G = { };
      psk-TP-LINK_CD28 = { };
      sing-box-outbound = { };
    };

    defaultSopsFile = ./secrets.yaml;

    templates.networkmanager.content = ''
      PSK_SUSTech_5G='${config.sops.placeholder.psk-SUSTech_5G}'
      PSK_TP_LINK_CD28='${config.sops.placeholder.psk-TP-LINK_CD28}'
    '';
  };
}
