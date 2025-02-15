{
  services.firewalld = {
    enable = true;
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
    # allowedTCPPorts = [
    #   # localsend
    #   53317
    # ];
    # allowedUDPPortRanges = [
    #   # kdeconnect
    #   {
    #     from = 1714;
    #     to = 1764;
    #   }
    # ];
    # allowedUDPPorts = [
    #   # localsend
    #   53317
    # ];
  };
}
