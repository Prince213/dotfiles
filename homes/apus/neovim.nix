{ pkgs, neovim-nightly, ... }:
{
  programs.nixvim = {
    enable = true;
    package = neovim-nightly.packages.default;
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
      colorcolumn = [ 80 ];
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
      softtabstop = -1;
    };

    keymaps = [
      {
        mode = "n";
        key = "<Leader>e";
        action = "<Cmd>Neotree toggle<CR>";
      }
      {
        mode = "n";
        key = "<Leader>xx";
        action = "<Cmd>Trouble diagnostics toggle<CR>";
      }
    ];

    filetype = {
      extension = {
        beancount = "bc";
      };
    };

    diagnostics = {
      virtual_text = true;
      virtual_lines = {
        current_line = true;
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

      gitsigns = {
        enable = true;
        settings = {
          current_line_blame = true;
        };
      };

      image.enable = true;
      indent-blankline.enable = true;
      leap.enable = true;

      lsp = {
        enable = true;
        keymaps = {
          lspBuf = {
            "gd" = "definition";
            "<Leader>ca" = "code_action";
            "<Leader>f" = "format";
          };
        };
        servers = {
          beancount = {
            enable = true;
            filetypes = [ "bc" ];
          };
          clangd = {
            enable = true;
            package = null;
          };
          gopls.enable = true;
          jsonls.enable = true;
          nixd = {
            enable = true;
            package = null;
            settings =
              let
                self = "(builtins.getFlake \"${toString ../..}\")";
                system = "${self}.nixosConfigurations.apus";
                home = "${system}.options.home-manager.users.type";
              in
              {
                nixpkgs.expr = "${system}._module.args.pkgs";
                options = {
                  nixos.expr = "${system}.options";
                  home-manager.expr = "${home}.getSubOptions []";
                };
              };
          };
          texlab.enable = true;
        };
      };

      lualine.enable = true;
      neoconf.enable = true;
      neo-tree.enable = true;
      noice.enable = true;
      notify.enable = true;

      telescope = {
        enable = true;
        keymaps = {
          "<Leader>ff" = "find_files";
          "<Leader>fg" = "live_grep";
        };
      };

      treesitter =
        let
          package = pkgs.vimPlugins.nvim-treesitter;
        in
        {
          enable = true;
          inherit package;
          grammarPackages = with package.builtGrammars; [
            bash
            beancount
            c
            jsonc
            latex
            lua
            markdown
            markdown_inline
            nix
            query
            regex
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
