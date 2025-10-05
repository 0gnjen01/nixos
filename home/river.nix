{config, lib, ... }:
{
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
      border-width = 2;
      declare-mode = [
        "locked"
        "normal"
        "passthrough"
      ];
      map = {
        normal = {
          # Super+Q to close the focused view      
          "Super+Shift Q" = "close"; 
          # Spawning       
          "Super Q" = "spawn foot";
          "Super R" = "spawn fuzzel";
          "Super A" = "spawn firefox";
          "Super D" = "spawn vesktop";
          "Super C" = " spawn 'grim -g \"\$(slurp)\" - | wl-copy' ";
          "Super+Shift+C" = " spawn 'grim - | wl-copy' ";
          # Super+Shift+E to exit river      
          "Super+Shift M" = "exit";
          # Super+J and Super+K to focus the next/previous view in the layout stack     
          "Super J" = "focus-view next";
          "Super K" = "focus-view previous";
          # Super+Shift+J and Super+Shift+K to swap the focused view with the next/previous
          # view in the layout stack      
          "Super+Shift J" = "swap next";
          "Super+Shift K" = "swap previous";
          # Super+Period and Super+Comma to focus the next/previous output      
          "Super Period" = "focus-output next";
          "Super Comma" = "focus-output previous";
          # Super+Shift+{Period,Comma} to send the focused view to the next/previous output      
          "Super+Shift Period" = "send-to-output next";
          "Super+Shift Comma" = "send-to-output previous";
          # Super+Return to bump the focused view to the top of the layout stack      
          "Super Return" = "zoom";
          # Super+H and Super+L to decrease/increase the main ratio of rivertile(1)      
          "Super H" = ''send-layout-cmd rivertile "main-ratio -0.05"'';
          "Super L" = ''send-layout-cmd rivertile "main-ratio +0.05"'';
          # Super+Shift+H and Super+Shift+L to increment/decrement the main count of rivertile(1)      
          "Super+Shift H" = "send-layout-cmd rivertile main-count +1";
          "Super+Shift L" = "send-layout-cmd rivertile main-count -1";
          # Super+Alt+{H,J,K,L} to move views      
          "Super+Alt H" = "move left 100";
          "Super+Alt J" = "move down 100";
          "Super+Alt K" = "move up 100";
          "Super+Alt L" = "move right 100";
          # Super+Alt+Control+{H,J,K,L} to snap views to screen edges      
          "Super+Alt+Shift H" = "resize horizontal -100";     
          "Super+Alt+Shift J" = "resize vertical 100";     
          "Super+Alt+Shift K" = "resize vertical -100";    
          "Super+Alt+Shift L" = "resize horizontal 100";
          # Super+Space to toggle float
          "Super Space" = "toggle-float";
          # Super+Space to toggle float
          "Super F" = "toggle-fullscreen";
          # Super+{Up,Right,Down,Left} to change layout orientation
          "Super Up" = ''send-layout-cmd rivertile "main-location top"'';
          "Super Right" = ''send-layout-cmd rivertile "main-location right"'';
          "Super Down" = ''send-layout-cmd rivertile "main-location down"'';
          "Super Left" = ''send-layout-cmd rivertile "main-location left"'';
          # Super+F11 to enter passthrough mode
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
      # Startup                  
      spawn = [
        "kanshi"
        "wpaperd"
      ];
    };  
    extraConfig = ''
        # Background and border colors
        riverctl background-color 0x002b36
        riverctl border-color-focused 0x8DA3B9
        riverctl border-color-unfocused 0x151515
              
        # Default layout
        riverctl default-layout rivertile      
        rivertile -view-padding 0 -outer-padding 0 &
        riverctl attach-mode bottom

        # Tag mappings (1-9)
        for i in $(seq 1 9)
        do
            tags=$((1 << ($i - 1)))

            # Super+[1-9] to focus tag [0-8]
            riverctl map normal Super $i set-focused-tags $tags

            # Super+Shift+[1-9] to tag focused view with tag [0-8]
            riverctl map normal Super+Shift $i set-view-tags $tags

            # Super+Control+[1-9] to toggle focus of tag [0-8]
            riverctl map normal Super+Control $i toggle-focused-tags $tags

            # Super+Shift+Control+[1-9] to toggle tag [0-8] of focused view
            riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
        done

        # Super+0 to focus all tags
        # Super+Shift+0 to tag focused view with all tags
        all_tags=$(((1 << 32) - 1))
        riverctl map normal Super 0 set-focused-tags $all_tags
        riverctl map normal Super+Shift 0 set-view-tags $all_tags

        # Media keys for both normal and locked modes
        for mode in normal locked
        do
          riverctl map $mode None XF86Eject spawn 'eject -T'
          riverctl map $mode None XF86AudioRaiseVolume spawn 'wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+'
          riverctl map $mode None XF86AudioLowerVolume spawn 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'
          riverctl map $mode None XF86AudioMute spawn 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'
          riverctl map $mode None XF86AudioMedia spawn 'playerctl play-pause'
          riverctl map $mode None XF86AudioPlay spawn 'playerctl play-pause'
          riverctl map $mode None XF86AudioPrev spawn 'playerctl previous'
          riverctl map $mode None XF86AudioNext spawn 'playerctl next'
        done
    '';
  };
}
