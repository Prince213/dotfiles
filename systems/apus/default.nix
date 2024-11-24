{
  system.stateVersion = "24.11";

  networking.hostName = "apus";
  nixpkgs.hostPlatform = "x86_64-linux";

  imports = [
    ./boot.nix
    ./disk.nix
    ./networking.nix
    ./packages.nix
    ./secrets.nix
    ./users.nix
  ];
}
