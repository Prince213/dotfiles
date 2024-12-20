{ pkgs, neovim-nightly, ... }:
{
  programs.neovim = {
    enable = true;
    package = neovim-nightly.packages.${pkgs.system}.default;
  };
}
