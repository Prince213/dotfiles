{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.firewalld;
  settingsFormat = pkgs.formats.keyValue { };
  settingsOptions = {
    freeformType = settingsFormat.type;
    options = {
      DefaultZone = lib.mkOption {
        type = lib.types.str;
        default = "public";
      };
      CleanupOnExit = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      CleanupModulesOnExit = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      IPv6_rpfilter = lib.mkOption {
        type = lib.types.enum [
          "strict"
          "loose"
          "strict-forward"
          "loose-forward"
          "no"
        ];
        default = "strict";
      };
      IndividualCalls = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      LogDenied = lib.mkOption {
        type = lib.types.enum [
          "all"
          "unicast"
          "broadcast"
          "multicast"
          "off"
        ];
        default = "off";
      };
      FirewallBackend = lib.mkOption {
        type = lib.types.enum [
          "nftables"
          "iptables"
        ];
        default = "nftables";
      };
      FlushAllOnReload = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      ReloadPolicy = lib.mkOption {
        type =
          let
            policy = lib.types.enum [
              "DROP"
              "REJECT"
              "ACCEPT"
            ];
          in
          lib.types.either policy lib.types.commas;
        default = "INPUT:DROP,FORWARD:DROP,OUTPUT:DROP";
      };
      RFC3964_IPv4 = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
      StrictForwardPorts = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      NftablesFlowtable = lib.mkOption {
        type = lib.types.separatedString " ";
        default = "off";
      };
      NftablesCounters = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
      NftablesTableOwner = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };
    };
  };
  serviceOptions = {
    options = {
      short = lib.mkOption {
        type = lib.types.str;
        default = "";
      };
    };
  };
in
{
  options.services.firewalld = {
    enable = lib.mkEnableOption "FirewallD";
    package = lib.mkPackageOption pkgs "firewalld" { };
    settings = lib.mkOption {
      description = ''
        firewalld config file. See {manpage}`firewalld.conf(5)`.
      '';
      default = { };
      type = lib.types.submodule settingsOptions;
    };
    services = lib.mkOption {
      description = ''
        firewalld service configuration files. See {manpage}`firewalld.service(5)`.
      '';
      default = { };
      type = lib.types.attrsOf (lib.types.submodule serviceOptions);
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];

    environment.etc =
      {
        "firewalld/firewalld.conf" = {
          source = settingsFormat.generate "firewalld.conf" cfg.settings;
        };
      }
      // (lib.mapAttrs' (
        name: value:
        lib.nameValuePair "firewalld/services/${name}.xml" {
          source = (pkgs.formats.xml { }).generate "firewalld-service-${name}.xml" {
            service = {
              inherit (value) short;
            };
          };
        }
      ) cfg.services);

    systemd.services.firewalld = {
      description = "firewalld - dynamic firewall daemon";
      before = [ "network-pre.target" ];
      wants = [ "network-pre.target" ];
      after = [
        "dbus.service"
        "polkit.service"
      ];
      conflicts = [
        "iptables.service"
        "ip6tables.service"
        "ebtables.service"
        "ipset.service"
      ];
      documentation = [ "man:firewalld(1)" ];

      aliases = [ "dbus-org.fedoraproject.FirewallD1.service" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        EnvironmentFile = [ "-/etc/sysconfig/firewalld" ];
        ExecStart = "${cfg.package}/bin/firewalld --nofork --nopid $FIREWALLD_ARGS";
        ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
        StandardOutput = "null";
        StandardError = "null";
        Type = "dbus";
        BusName = "org.fedoraproject.FirewallD1";
        KillMode = "mixed";
        DevicePolicy = "closed";
        KeyringMode = "private";
        LockPersonality = true;
        MemoryDenyWriteExecute = true;
        PrivateDevices = true;
        ProtectClock = true;
        ProtectControlGroups = true;
        ProtectHome = true;
        ProtectHostname = true;
        ProtectKernelLogs = true;
        ProtectKernelModules = false;
        ProtectKernelTunables = false;
        ProtectSystem = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        SystemCallArchitectures = "native";
      };
    };
  };
}
