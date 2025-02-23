{ pkgs, ... }:
{
  services.sing-box = {
    enable = true;
    package = pkgs.sing-box-beta;
    settings = {
      log = {
        level = "info";
      };
      dns = {
        servers = [
          {
            type = "https";
            server = "dns.google";
            domain_resolver = "alidns";
            detour = "proxy";
          }
          {
            type = "https";
            tag = "alidns";
            server = "223.5.5.5";
            detour = "direct";
          }
        ];
        reverse_mapping = true;
      };
    };
  };
}
