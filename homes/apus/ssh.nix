{ config, ... }:
{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "1h";
    includes = [ config.sops.secrets.ssh-config.path ];
  };

  services.ssh-agent.enable = true;
}
