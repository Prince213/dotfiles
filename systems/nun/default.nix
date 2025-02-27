{
  system.stateVersion = "24.11";

  networking.hostName = "nun";
  nixpkgs.hostPlatform = "x86_64-linux";

  imports = [
    ./disk.nix
  ];
}
