{ pkgs, lib, ...}:

{
  vim = {
    theme = {
      enable = true;
      name = "oxocarbon";
      style = "dark";
    };
    
    clipboard.providers.wl-copy.enable = true;            
    vimAlias = true;
    lsp.enable = true;

    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;

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
  };
}
