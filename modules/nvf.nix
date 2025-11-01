{pkgs, ...}: {
  vim = {
    autopairs.nvim-autopairs.enable = true;

    statusline.lualine.enable = true;

    autocomplete.blink-cmp.enable = true;

    ui.colorizer = {
      enable = true;
      setupOpts = {
        filetypes = {
          "*" = {
            mode = "background";
            tailwind = true;
            names = true;
            css = true;
          };
        };
      };
    };

    options = {
      autoindent = true;
      shiftwidth = 2;
    };

    clipboard = {
      registers = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    languages = {
      enableTreesitter = true;
      nix = {
        enable = true;
        extraDiagnostics.enable = true;
        format = {
          enable = true;
          type = "alejandra";
        };
      };
    };

    git = {
      enable = true;
      git-conflict.enable = true;
      gitsigns.enable = true;
    };

    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
    };

    extraPlugins = {
      zenbones = {
        package = pkgs.vimPlugins.zenbones-nvim;
        setup = ''
          vim.cmd.colorscheme("zenbones")
        '';
      };
      lush = {
        package = pkgs.vimPlugins.lush-nvim;
      };
    };
  };
}
