{ pkgs, neovim-nightly, ... }:
{
  programs.nixvim = {
    enable = true;
    package = neovim-nightly.packages.${pkgs.system}.default;
    defaultEditor = true;

    colorschemes.gruvbox.enable = true;

    globals = rec {
      mapleader = ",";
      maplocalleader = mapleader;
    };

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

    keymaps = [
      {
        mode = "n";
        key = "<Leader>e";
        action = "<Cmd>Neotree toggle<CR>";
      }
    ];

    filetype = {
      extension = {
        beancount = "bc";
      };
    };

    plugins = {
      gitsigns.enable = true;
      image.enable = true;
      indent-blankline.enable = true;
      leap.enable = true;
      lsp.enable = true;
      lualine.enable = true;
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

      vimtex = {
        enable = true;
        texlivePackage = null;
      };

      web-devicons.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      tabby-nvim
    ];

    extraConfigLua = ''
      require("tabby").setup { preset = "active_wins_at_tail" }
    '';
  };
}
