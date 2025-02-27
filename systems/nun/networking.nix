{ config, ... }:
{
  networking = {
    useNetworkd = true;
    usePredictableInterfaceNames = false;
  };
  systemd.network = {
    enable = true;
    networks = {
      "10-eth0" = {
        name = "eth0";
      };
    };
  };

  environment.etc = {
    "systemd/network/10-eth0.network.d/10-network.conf".source = config.sops.secrets.network-eth0.path;
  };
}
