{
  pkgs,
  lib,
  ...
}: {
  vim = {
    statusline.lualine.enable = true;

    telescope.enable = true;

    autocomplete.blink-cmp.enable = true;

    languages = {
      enableTreesitter = true;
      nix = {
        enable = true;
        treesitter.enable = true;
        format.enable = true;
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
