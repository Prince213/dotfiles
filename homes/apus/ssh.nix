{ config, ... }:
{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "1h";
    includes = [ config.sops.secrets.ssh-config.path ];
    matchBlocks = {
      nun = {
        host = "nun";
        user = "root";
        identityFile = config.sops.secrets.nun-ssh-root-key.path;
        identitiesOnly = true;
      };
    };
  };

  services.ssh-agent.enable = true;
}
