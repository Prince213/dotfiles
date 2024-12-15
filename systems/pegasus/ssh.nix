{ config, ... }:
{
  services.openssh = {
    settings.AuthenticationMethods = "publickey";
    extraConfig = ''
      Include ${config.sops.templates.openssh.path}
    '';
  };
}
