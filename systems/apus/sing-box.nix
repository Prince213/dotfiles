{ pkgs, ... }:
{
  services.sing-box = {
    enable = true;
    package = pkgs.sing-box-beta;
    settings = {
      log = {
        level = "info";
      };
    };
  };
}
