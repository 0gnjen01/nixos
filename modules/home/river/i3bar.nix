{ pkgs, ... }:
{
  programs.i3bar-river = {
    enable = true;
    settings = {
      background = "#1C1917FF";
      color = "#B4BDC3FF";
      font = "TX02 Nerd Font Mono 10";
      height = 24;
      margin_bottom = 0;
      margin_left = 0;
      margin_top = 0;
      separator = "#B4BDC3FF";
      "wm.river" = {
        max_tag = 0;
      };
    };
  };
  programs.i3status = {
    enable = true;
  };
}
