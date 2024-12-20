{ pkgs, neovim-nightly, ... }:
{
  programs.nixvim = {
    enable = true;
    package = neovim-nightly.packages.${pkgs.system}.default;
    defaultEditor = true;

    colorschemes.tokyonight.enable = true;

    plugins = {
      treesitter = {
        enable = true;
      };
    };
  };
}
