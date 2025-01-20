{ pkgs, ... }:
{
  users.users.prince213 = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "podman"
    ];
    shell = pkgs.zsh;
  };

  nix.settings.trusted-users = [ "prince213" ];
}
