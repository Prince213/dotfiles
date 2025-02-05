{ pkgs, ... }:
{
  virtualisation.podman = {
    enable = true;
    dockerSocket.enable = true;
  };

  environment.systemPackages = with pkgs; [
    docker-client
  ];

  virtualisation.oci-containers.containers = {
    atrust = {
      serviceName = "atrust";
      autoStart = false;
      image = "docker.io/hagb/docker-atrust:vncless";
      pull = "never";
      imageFile = pkgs.dockerTools.pullImage {
        imageName = "docker.io/hagb/docker-atrust";
        imageDigest = "sha256:26f8a5c4f75ca3ff1f536baeab7e8b91062ac7bc97648460e9acb0e232f588dc";
        finalImageTag = "vncless";
        hash = "sha256-OOyYNdXkq9PnWJ2qwcJjy15pm1zBjK22XkhdfvybHWQ=";
      };
      capabilities = {
        NET_ADMIN = true;
      };
      devices = [ "/dev/net/tun" ];
      ports = [
        "127.0.0.1:1080:1080"
        "127.0.0.1:54631:54631"
      ];
    };
  };
}
