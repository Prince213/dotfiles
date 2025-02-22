{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.dae = {
    enable = true;
    openFirewall = {
      enable = true;
      port = 12345;
    };
    configFile = config.sops.secrets.dae.path;
  };

  networking.networkmanager.dispatcherScripts =
    let
      systemctl = lib.getExe' pkgs.systemdMinimal "systemctl";
    in
    [
      {
        type = "basic";
        source = pkgs.writeShellScript "start-dae" ''
          if test "x$2" = "xup"; then
            ${systemctl} start dae.service
          fi
        '';
      }
      {
        type = "pre-down";
        source = pkgs.writeShellScript "stop-dae" ''
          ${systemctl} stop dae.service
        '';
      }
    ];
}
