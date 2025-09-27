{ pkgs, lib, ...}:

{
  vim = {

    clipboard.providers.wl-copy.enable = true;            
    vimAlias = true;
    lsp.enable = true;

    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;

    ui.colorizer.enable = true;

    languages = {
      enableTreesitter = true;
      nix = {
        enable = true;
        format.enable =  true;
        lsp.enable = true;
      };   
    };
    options = {
      autoindent = true;
      shiftwidth = 2;
    };
    extraPlugins = {
      lackluster = {
        package = pkgs.vimPlugins.lackluster-nvim;
      };
    };
  };
}
