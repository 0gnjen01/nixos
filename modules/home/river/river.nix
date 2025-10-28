{pkgs, ...}: {

  xdg.portal.config.river = {
    default = ["wlr"];
  };

  programs.river-classic = {
    enable = true;
    extraPackages = with pkgs; [
      grim
      slurp

      wl-clipboard-rs
      wl-clip-persist

      creek
      posy-cursors
    ];
  };

  home-manager.users.ignis = {
    wayland.windowManager.river = {
      enable = true;
      systemd = {
        enable = true;
        extraCommands = [
          "systemctl --user import-environment PATH"
          "systemctl --user restart xdg-desktop-portal.service"
        ];
      };
      settings = {
        border-width = 3;
        declare-mode = [
          "locked"
          "normal"
          "passthrough"
        ];
        map = {
          normal = {
            "Super+Shift Q" = "close";
            "Super Q" = "spawn foot";
            "Super R" = "spawn fuzzel";
            "Super A" = "spawn firefox";
            "Super E" = "spawn 'foot -e yazi'";
            "Super D" = "spawn vesktop";
            "Super C" = "spawn 'grim -g \"$(slurp)\" - | wl-copy'";
            "Super+Shift C" = "spawn 'grim - | wl-copy'";
            "Super+Shift M" = "exit";
            "Super J" = "focus-view next";
            "Super K" = "focus-view previous";
            "Super+Shift J" = "swap next";
            "Super+Shift K" = "swap previous";
            "Super Period" = "focus-output next";
            "Super Comma" = "focus-output previous";
            "Super+Shift Period" = "send-to-output next";
            "Super+Shift Comma" = "send-to-output previous";
            "Super Return" = "zoom";
            "Super H" = ''send-layout-cmd rivertile "main-ratio -0.05"'';
            "Super L" = ''send-layout-cmd rivertile "main-ratio +0.05"'';
            "Super+Shift H" = "send-layout-cmd rivertile main-count +1";
            "Super+Shift L" = "send-layout-cmd rivertile main-count -1";
            "Super+Alt H" = "move left 100";
            "Super+Alt J" = "move down 100";
            "Super+Alt K" = "move up 100";
            "Super+Alt L" = "move right 100";
            "Super+Alt+Shift H" = "resize horizontal -100";
            "Super+Alt+Shift J" = "resize vertical 100";
            "Super+Alt+Shift K" = "resize vertical -100";
            "Super+Alt+Shift L" = "resize horizontal 100";
            "Super Space" = "toggle-float";
            "Super F" = "toggle-fullscreen";
            "Super Up" = ''send-layout-cmd rivertile "main-location top"'';
            "Super Right" = ''send-layout-cmd rivertile "main-location right"'';
            "Super Down" = ''send-layout-cmd rivertile "main-location down"'';
            "Super Left" = ''send-layout-cmd rivertile "main-location left"'';
            "Super F11" = "enter-mode passthrough";
          };
          passthrough = {
            "Super F11" = "enter-mode normal";
          };
        };
        map-pointer = {
          normal = {
            "Super BTN_LEFT" = "move-view";
            "Super BTN_RIGHT" = "resize-view";
            "Super BTN_MIDDLE" = "toggle-float";
          };
        };

        xcursor-theme = "Posy_Cursor";
        set-repeat = "50 300";

        spawn = [
          "kanshi"
          "wpaperd"
          "''sh -c 'while true; do date; sleep 1; done | creek -fn \"0xProto Nerd Font Mono:style=Regular:size=13\" -hg 25 -nf 0xB4BDC3 -nb 0x1C1917 -ff 0x1C1917 -fb 0x6099C0'''"
        ];
      };
      extraConfig = ''
        riverctl spawn "sh -c 'while true; do date; sleep 1; done | creek -fn \"0xProto Nerd Font Mono:style=Regular:size=13\" -hg 25 -nf 0xB4BDC3 -nb 0x1C1917 -ff 0x1C1917 -fb 0x6099C0'"

        riverctl background-color 0x1C1917
        riverctl border-color-focused 0xb4bdc3
        riverctl border-color-unfocused 0x403833

        riverctl default-layout rivertile
        rivertile -view-padding 0 -outer-padding 0 &
        riverctl attach-mode bottom

        for i in $(seq 1 9)
        do
            tags=$((1 << ($i - 1)))

            riverctl map normal Super $i set-focused-tags $tags

            riverctl map normal Super+Shift $i set-view-tags $tags

            riverctl map normal Super+Control $i toggle-focused-tags $tags

            riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
        done

        all_tags=$(((1 << 32) - 1))
        riverctl map normal Super 0 set-focused-tags $all_tags
        riverctl map normal Super+Shift 0 set-view-tags $all_tags

        for mode in normal locked
        do
          riverctl map $mode None XF86AudioRaiseVolume spawn 'wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+ && wp-vol'
          riverctl map $mode None XF86AudioLowerVolume spawn 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && wp-vol'
          riverctl map $mode None XF86AudioMute spawn 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'
          riverctl map $mode None XF86AudioMedia spawn 'playerctl play-pause'
          riverctl map $mode None XF86AudioPlay spawn 'playerctl play-pause'
          riverctl map $mode None XF86AudioPrev spawn 'playerctl previous'
          riverctl map $mode None XF86AudioNext spawn 'playerctl next'
        done
      '';
    };
  };
}
