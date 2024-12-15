{
  projectRootFile = "flake.nix";

  settings.global.excludes = [
    "LICENSE"
  ];

  programs.nixfmt.enable = true;
}
