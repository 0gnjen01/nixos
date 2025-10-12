{ pkgs, lib, ... }:
{
  programs.firefox = {
    enable = true;
    policies = {
      ExtensionSettings = {
        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };      
        # I still don't care about cookies
        "idcac-pub@guus.ninja" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
    profiles.default = {
      isDefault = true;
      path = "/home/ignis/.mozilla/firefox/default/";
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      userChrome = (builtins.readFile ./userChrome.css);
    };
  };
}
