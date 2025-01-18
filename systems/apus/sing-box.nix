{ packages, ... }:
{
  services.sing-box = {
    enable = true;
    package = packages.sing-box;
    settings = {
      log = {
        level = "info";
      };
      inbounds = [
        {
          type = "mixed";
          listen = "127.0.0.1";
          listen_port = 2001;
        }
      ];
    };
  };
}
