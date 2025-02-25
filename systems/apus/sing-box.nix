{
  config,
  lib,
  pkgs,
  ...
}:
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
          {
            type = "udp";
            tag = "shtu";
            server = "10.15.44.11";
            detour = "direct";
          }
        ];
        rules = [
          {
            domain_suffix = ".shanghaitech.edu.cn";
            action = "route";
            server = "shtu";
          }
          {
            domain_suffix = ".edu.cn";
            action = "route";
            server = "alidns";
          }
        ];
        strategy = "ipv4_only";
        reverse_mapping = true;
      };
      inbounds = [
        {
          type = "tun";
          interface_name = "singbox0";
          address = [
            "172.18.0.1/30"
            "fdfe:dcba:9876::1/126"
          ];
          auto_route = true;
          auto_redirect = true;
          strict_route = true;
        }
      ];
      outbounds = {
        _secret = config.sops.secrets.sing-box-outbounds.path;
        quote = false;
      };
      route = {
        rules = [
          {
            action = "sniff";
          }
          {
            protocol = "dns";
            action = "hijack-dns";
          }
          {
            ip_cidr = "10.0.0.0/8";
            domain_suffix = ".edu.cn";
            action = "route";
            outbound = "direct";
          }
        ];
        auto_detect_interface = true;
        default_domain_resolver = "alidns";
      };
      experimental = {
        clash_api = {
          external_controller = "127.0.0.1:9090";
        };
      };
    };
  };

  networking.networkmanager.dispatcherScripts =
    let
      systemctl = lib.getExe' pkgs.systemdMinimal "systemctl";
      service = "sing-box.service";
    in
    [
      {
        type = "basic";
        source = pkgs.writeShellScript "start-sing-box" ''
          if test "x$2" = "xup"; then
            ${systemctl} start ${service}
          fi
        '';
      }
      {
        type = "pre-down";
        source = pkgs.writeShellScript "stop-sing-box" ''
          ${systemctl} stop ${service}
        '';
      }
    ];
}
