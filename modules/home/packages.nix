{
  lib,
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    cava

    mindustry
    prismlauncher
    krita
  ];

  services = {
    kanshi = {
      enable = true;
      settings = [
        {
          profile.name = "default";
          profile.outputs = [
            {
              criteria = "HDMI-A-1";
              mode = "1920x1080@144";
            }
          ];
        }
      ];
    };

    wpaperd = {
      enable = true;
      settings = {
        HDMI-A-1 = {
          path = "/home/ignis/Pictures/wallpaper.png";
        };
      };
    };
  };

  programs = {
    vesktop = {
      enable = true;
    };

    anki = {
      enable = true;
      addons = [
        pkgs.ankiAddons.review-heatmap
      ];
    };

    obsidian = {
      enable = true;
    };

    zathura = {
      enable = true;
      options = {
        default-bg = "#1C1917";
        default-fg = "#B4BDC3";
      };
    };

    obs-studio = {
      enable = true;
    };

    yazi = {
      enable = true;
    };

    mpv = {
      enable = true;
    };

    ssh = {
      enable = true;
      matchBlocks.ignis.addKeysToAgent = "yes";
    };

    git = {
      enable = true;
      userName = "0gnjen01";
      userEmail = "ognjenk0l3@gmail.com";
      signing = {
        key = "/home/ignis/.ssh/id_ed25519.pub";
        signByDefault = true;
      };
      extraConfig = {
        gpg.format = "ssh";
      };
    };

    lazygit = {
      enable = true;
    };

    btop = {
      enable = true;
      settings = {
        color_theme = "TTY";
      };
    };

    translate-shell = {
      enable = true;
    };
  };

  xdg = {
    mimeApps.enable = true;
  };
}
