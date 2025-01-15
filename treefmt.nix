{
  projectRootFile = "flake.nix";

  settings.global.excludes = [
    "LICENSE"
    "README.md"
    ".envrc"
    ".clang-format"
    "homes/apus/p10k.zsh"
  ];

  programs = {
    clang-format.enable = true;
    nixfmt.enable = true;
    yamlfmt.enable = true;
  };
}
