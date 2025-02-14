{ lib, ... }:
{
  services.openssh = {
    enable = lib.mkDefault true;
    settings = {
      AuthenticationMethods = lib.mkDefault "publickey";
      KbdInteractiveAuthentication = lib.mkDefault false;
      PasswordAuthentication = lib.mkDefault false;
    };
    hostKeys = lib.mkDefault [
      {
        type = "ed25519";
        path = "/etc/ssh/ssh_host_ed25519_key";
      }
    ];
  };
}
