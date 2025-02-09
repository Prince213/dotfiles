{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    drivers = [
      pkgs.mccgdi
    ];
  };
}
