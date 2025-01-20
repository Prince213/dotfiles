{ pkgs, ... }:
{
  virtualisation.podman = {
    enable = true;
    dockerSocket.enable = true;
  };

  environment.systemPackages = with pkgs; [
    docker-client
  ];
}
