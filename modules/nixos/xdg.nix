{...}:
{
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      wlr = {
        enable = true;
          settings.screencast = {
            output_name = "HDMI-A-1";
            max_fps = 30;
            chooser_type = "simple";
            chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
          };
        };
      config = {
        mime = {
          enable = true;
          defaultApplications = {
            "inode/directory" = "nemo.desktop";
            "application/pdf" = "org.pwmt.zathura-cb.desktop";
            "image/png" = "swayimg.desktop";
          };
        };
        common = {
          default = ["wlr"];
          river = {
            default = ["wlr"];
          };
        };
      };
    };
  };
}
