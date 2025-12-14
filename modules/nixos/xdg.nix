{pkgs, ...}: {
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      wlr = {
        enable = true;
      };
      config = {
        river = {
          default = ["wlr"];
        };
      };
    };
    mime = {
      enable = true;
      defaultApplications = {
        "inode/directory" = "nemo.desktop";
        "application/pdf" = "org.pwmt.zathura-cb.desktop";
        "image/png" = "swayimg.desktop";
      };
    };
  };
}
