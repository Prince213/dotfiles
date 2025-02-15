{ config, lib, ... }:

let
  cfg = config.services.firewalld;
in
{
  options.services.firewalld = {
    enable = lib.mkEnableOption "FirewallD";
  };

  config = lib.mkIf cfg.enable {
  };
}
