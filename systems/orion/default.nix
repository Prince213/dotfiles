{
  system.stateVersion = "24.11";

  networking.hostName = "orion";
  nixpkgs.hostPlatform = "x86_64-linux";

  time.timeZone = "Asia/Shanghai";

  imports = [
    ./boot.nix
    ./disk.nix
  ];
}
