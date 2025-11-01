{...}: {
  gtk = {
    enable = true;
    gtk3 = {
      enable = true;
      extraCss = ''
        /* No (default) title bar on wayland */
        headerbar.default-decoration {
          /* You may need to tweak these values depending on your GTK theme */
          margin-bottom: 50px;
          margin-top: -100px;
        }

        /* rm -rf window shadows */
        window.csd decoration { /* gtk3 */
          box-shadow: none;
        }
      '';
    };

    gtk4 = {
      enable = true;
      extraCss = ''
        /* No (default) title bar on wayland */
        headerbar.default-decoration {
          /* You may need to tweak these values depending on your GTK theme */
          margin-bottom: 50px;
          margin-top: -100px;
        }

        /* rm -rf window shadows */
        window.csd {             /* gtk4 */
          box-shadow: none;
        }
      '';
    };
  };
}
