{
  projectRootFile = "flake.nix";

  settings.global.excludes = [
    "LICENSE"
    "README.md"
  ];

  programs.nixfmt.enable = true;
}
