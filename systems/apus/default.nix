{
  system.stateVersion = "24.11";

  networking.hostName = "apus";
  nixpkgs.hostPlatform = "x86_64-linux";

  time.timeZone = "Asia/Shanghai";

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  imports = [
    ./boot.nix
    ./disk.nix
    ./graphics.nix
    ./i18n.nix
    ./networking.nix
    ./packages.nix
    ./podman.nix
    ./printing.nix
    ./secrets.nix
    ./sing-box.nix
    ./users.nix
  ];
}
