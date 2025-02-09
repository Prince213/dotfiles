{ config, pkgs, ... }:
{
  services.sing-box = {
    enable = true;
    package = pkgs.sing-box;
    settings = {
      log = {
        level = "info";
      };
      inbounds = [
        {
          type = "mixed";
          listen = "127.0.0.1";
          listen_port = 2001;
        }
      ];
      outbounds = [
        {
          _secret = config.sops.secrets.sing-box-outbound.path;
          quote = false;
        }
      ];
    };
  };
}
