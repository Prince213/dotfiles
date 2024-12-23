{ pkgs, neovim-nightly, ... }:
{
  programs.nixvim = {
    enable = true;
    package = neovim-nightly.packages.${pkgs.system}.default;
    defaultEditor = true;

    colorschemes.ayu.enable = true;

    opts = {
      expandtab = true;
      listchars = {
        space = "·";
      };
      list = true;
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    filetype = {
      extension = {
        beancount = "bc";
      };
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
            beancount
            c
            latex
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
