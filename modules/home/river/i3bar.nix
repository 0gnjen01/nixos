{ pkgs, ... }:

environment.systemPackages = with pkgs; [
  i3status-rs
];
home-manager.users.ignis = {
  programs.i3bar-river = {
    enable = true;
    settings = {
      background = "#1C1917";
      color = "#B4BDC3";
      font = "TX02 Nerd Font Mono 10";
      height = 24;
      margin_bottom = 0;
      margin_left = 0;
      margin_top = 0;
      separator = "#9a8a62ff";
      "wm.river" = {
        max_tag = 0;
    };
  };
};
