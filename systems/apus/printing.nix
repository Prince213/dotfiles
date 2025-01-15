{ packages, ... }:
{
  services.printing = {
    enable = true;
    drivers = [
      packages.mccgdi
    ];
  };
}
