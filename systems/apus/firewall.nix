{
  services.firewalld = {
    enable = true;
    services = {
      localsend = {
        short = "LocalSend";
        ports = [
          {
            port = 53317;
            protocol = "tcp";
          }
          {
            port = 53317;
            protocol = "udp";
          }
        ];
      };
    };
    zones = {
      public = {
        services = [
          "localsend"
        ];
      };
    };
  };

  networking.firewall = {
    enable = false;
    # allowedTCPPortRanges = [
    #   # kdeconnect
    #   {
    #     from = 1714;
    #     to = 1764;
    #   }
    # ];
    # allowedUDPPortRanges = [
    #   # kdeconnect
    #   {
    #     from = 1714;
    #     to = 1764;
    #   }
    # ];
  };
}
