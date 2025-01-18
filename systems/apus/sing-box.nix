{ packages, ... }:
{
  services.sing-box = {
    enable = true;
    package = packages.sing-box;
  };
}
