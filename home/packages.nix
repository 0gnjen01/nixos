{ lib, inputs, pkgs, ... }:

{
  home.packages = with pkgs; [

    cava
    
    waylock
    grim
    slurp

    wl-clipboard-rs
    wl-clip-persist
    wf-recorder

    prismlauncher
    krita
  ];

  services = {
    kanshi = {
      enable = true;
      settings = [
        { profile.name = "default";
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
    hypridle = {
      enable = true;
      settings = {
        general = {
          ignore_dbus_inhibit = true;
          lock_cmd = "waylock";
          };

        listener = [
          {
          timeout = 300;
          on-timeout = "loginctl lock-session";
          }
        ];
      };
    };
  };

  programs = {
    fish = {
      enable = true;
    };

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
    };

    yazi = {
      enable = true;
      plugins = {
        inherit (pkgs.yaziPlugins) sudo git lazygit chmod recycle-bin wl-clipboard full-border;
      };
    };

    feh = {
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
}
