{ pkgs, lib, ...}:

{
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

    extraPlugins = {
      lackluster = {
        package = pkgs.vimPlugins.lackluster-nvim;
        setup = ''
          require('lackluster').setup{}
          vim.cmd.colorscheme("lackluster-hack")
        '';
      };
    };
  };
}
