{
  projectRootFile = "flake.nix";

  settings.global.excludes = [
    "LICENSE"
    "README.md"
    "homes/apus/p10k.zsh"
  ];

  programs = {
    nixfmt.enable = true;
    yamlfmt.enable = true;
  };
}
