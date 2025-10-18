{ pkgs, ...}:

{
  services.mako = {
    enable = true;
    settings = {
      layer = "overlay";
      background-color = "#1C1917";
      font = "JetBrainsMono Nerd Font 12";
      text-color = "#B4BDC3";
      progress-color = "#1C1917";
      border-color = "#1C1917";
      border-size = 1;
      border-radius = 0;
      margin = "12";
      padding = "0,5,10";
      width = 300;
      height = 110;
      icons = true;
      max-icon-size = 64;
      default-timeout = 5000;
    };
  };
}
