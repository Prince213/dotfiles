{ packages, ... }:
{
  services.sing-box = {
    package = packages.sing-box;
  };
}
