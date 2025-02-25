{
  networking.firewall.allowedTCPPorts = [
    80
  ];

  services.caddy = {
    enable = true;
    virtualHosts = {
      "http://" = {
        extraConfig = ''
          root * /srv
          file_server
        '';
      };
    };
  };
}
