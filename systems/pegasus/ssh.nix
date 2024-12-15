{ config, ... }:
{
  services.openssh.extraConfig = ''
    Include ${config.sops.templates.openssh.path}
  '';
}
