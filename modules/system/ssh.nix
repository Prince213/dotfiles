{ lib, ... }:
{
  services.openssh = {
    enable = lib.mkDefault true;
    settings = {
      AuthenticationMethods = lib.mkDefault "publickey";
    };
  };
}
