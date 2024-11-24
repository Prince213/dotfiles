{
  system.stateVersion = "24.11";

  networking.hostName = "pegasus";
  nixpkgs.hostPlatform = "aarch64-linux";

  imports = [
    ./boot.nix
    ./disk.nix
    ./networking.nix
    ./packages.nix
    ./secrets.nix
    ./ssh.nix
    ./tailscale.nix
    ./users.nix
  ];
}
