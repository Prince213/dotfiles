{ pkgs, ... }:
{
  users.users.prince213 = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "podman"
      "dialout"
      "adbusers"
    ];
    shell = pkgs.zsh;
  };

  nix.settings.trusted-users = [ "prince213" ];
}
