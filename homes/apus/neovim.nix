{ pkgs, neovim-nightly, ... }:
{
  programs.nixvim = {
    enable = true;
    package = neovim-nightly.packages.${pkgs.system}.default;
    defaultEditor = true;

    colorschemes.tokyonight.enable = true;

    opts = {
      expandtab = true;
      number = true;
      shiftwidth = 2;
    };

    plugins = {
      neo-tree.enable = true;

      treesitter =
        let
          package = pkgs.vimPlugins.nvim-treesitter;
        in
        {
          enable = true;
          inherit package;
          grammarPackages = with package.builtGrammars; [
            c
            lua
            markdown
            markdown_inline
            nix
            query
            vim
            vimdoc
          ];
        };

      web-devicons.enable = true;
    };
  };
}
