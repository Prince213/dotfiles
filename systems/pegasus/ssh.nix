{ config, ... }:
{
  services.openssh = {
    enable = true;
    settings.AuthenticationMethods = "publickey";
    extraConfig = ''
      Include ${config.sops.templates.openssh.path}
    '';
  };
}
