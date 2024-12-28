{ pkgs, neovim-nightly, ... }:
{
  programs.nixvim = {
    enable = true;
    package = neovim-nightly.packages.${pkgs.system}.default;
    defaultEditor = true;

    colorschemes.nightfox = {
      enable = true;
      flavor = "carbonfox";
    };

    globals = rec {
      mapleader = ",";
      maplocalleader = mapleader;
    };

    opts = {
      expandtab = true;
      listchars = {
        space = "·";
        tab = ">-";
      };
      list = true;
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      showtabline = 2;
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
      cmp = {
        enable = true;
        settings = {
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<CR>" = "cmp.mapping.confirm { select = true }";
          };
          sources = [
            { name = "nvim_lsp"; }
          ];
        };
      };

      gitsigns.enable = true;
      image.enable = true;
      indent-blankline.enable = true;
      leap.enable = true;

      lsp = {
        enable = true;
        keymaps = {
          lspBuf = {
            "<Leader>ca" = "code_action";
            "<Leader>f" = "format";
          };
        };
        servers = {
          clangd = {
            enable = true;
            package = null;
          };
          gopls.enable = true;
          nixd.enable = true;
        };
      };

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

      trouble.enable = true;

      vimtex = {
        enable = true;
        texlivePackage = null;
      };

      web-devicons.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      dropbar-nvim
      tabby-nvim
    ];

    extraConfigLua = ''
      require("tabby").setup { preset = "active_wins_at_tail" }
    '';
  };
}
