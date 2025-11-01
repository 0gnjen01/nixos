{pkgs, ...}: {
  vim = {
    statusline.lualine.enable = true;

    telescope.enable = true;

    autocomplete.blink-cmp.enable = true;

    ui.colorizer = {
      enable = true;
      setupOpts = {
        "*" = {
          mode = "background";
          RGB = true;
          RRGGBB = true;
          RRGGBBAA = true;
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

    lsp = {
      enable = true;
      formatOnSave = true;
    };

    languages = {
      nix = {
        enable = true;
        extraDiagnostics.enable = true;
        format = {
          enable = true;
          type = "alejandra";
        };
      };
      enableTreesitter = true;
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
