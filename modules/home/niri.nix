{ config, lib, inputs, pkgs, ... }: 

let 
  inherit (lib)
    getExe
    ;
in
{
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs.niri = {
    enable = true;

    package = pkgs.niri-unstable;

    settings = {
      xwayland-satellite = {
        enable = true;
        path = lib.getExe pkgs.xwayland-satellite-unstable;
      };

      input = {
        keyboard.xkb = {
          layout = "us";
        };
        mouse = {
          accel-speed = 0.2;
        };
      };

      outputs = {
        "HDMI-A-1" = {
          enable = true;
          mode.width = 1920;
          mode.height = 1080;
          mode.refresh = 144.0;
        };
      };

      layout = {

        gaps = 16;

        center-focused-column = "never";

        preset-column-widths = [
          { proportion = 1.0 / 3.0; }
          { proportion = 1.0 / 2.0; }
          { proportion = 2.0 / 3.0; }
        ];

        default-column-width = { proportion = 1.0 / 2.0; };

        focus-ring = {
          enable = true;

          width = 4;

          active-color = "#7fc8ff";

          inactive-color = "#505050";
        };

        border = {
          enable = true;

          width = 4;

          active-color = "#ffc87f";
          inactive-color = "#505050";

          urgent-color = "#9b0000";
        };
      };

      animations = {
        enable = false;
      };

      window-rules = {
      };

      binds = {
        hotkey-overlay = {
          hidden = false;
        };
          
        "Mod+O".action.show-hotkey-overlay = true;

        "Mod+Q".action.spawn = ["foot"];
        "Mod+R".action.spawn = ["fuzzel"];
        "Mod+A".action.spawn = ["firefox"];

        "XF86AudioRaiseVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@ 0.1+"];
        "XF86AudioLowerVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@ 0.1-"]; 
        "XF86AudioMute".action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@ toggle"]; 
        "XF86AudioMicMute".action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@ toggle"]; 

        "XF86AudioPlay".action.spawn = ["playerctl" "play-pause"]; 
        "XF86AudioStop".action.spawn = ["playerctl" "stop"]; 
        "XF86AudioPrev".action.spawn = ["playerctl" "previous"]; 
        "XF86AudioNext".action.spawn = ["playerctl" "next"]; 

        "Mod+Shift+Q".action.close-window = true; 

        "Mod+Left".action.focus-column-left = true; 
        "Mod+Down".action.focus-window-down = true;
        "Mod+Up".action.focus-window-up = true; 
        "Mod+Right".action.focus-column-right = true; 
        "Mod+H".action.focus-column-left = true; 
        "Mod+J".action.focus-window-down = true; 
        "Mod+K".action.focus-window-up = true; 
        "Mod+L".action.focus-column-right = true; 

        "Mod+Ctrl+Left".action.move-column-left = true; 
        "Mod+Ctrl+Down".action.move-window-down = true; 
        "Mod+Ctrl+Up".action.move-window-up = true; 
        "Mod+Ctrl+Right".action.move-column-right = true; 
        "Mod+Ctrl+H".action.move-column-left = true; 
        "Mod+Ctrl+J".action.move-window-down = true; 
        "Mod+Ctrl+K".action.move-window-up = true; 
        "Mod+Ctrl+L".action.move-column-right = true; 

        "Mod+Home".action.focus-column-first = true; 
        "Mod+End".action.focus-column-last = true; 
        "Mod+Ctrl+Home".action.move-column-to-first = true; 
        "Mod+Ctrl+End".action.move-column-to-last = true; 

        "Mod+Shift+Left".action.focus-monitor-left = true; 
        "Mod+Shift+Down".action.focus-monitor-down = true; 
        "Mod+Shift+Up".action.focus-monitor-up = true; 
        "Mod+Shift+Right".action.focus-monitor-right = true; 
        "Mod+Shift+H".action.focus-monitor-left = true; 
        "Mod+Shift+J".action.focus-monitor-down = true; 
        "Mod+Shift+K".action.focus-monitor-up = true; 
        "Mod+Shift+L".action.focus-monitor-right = true; 

        "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = true; 
        "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = true; 
        "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = true; 
        "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = true; 
        "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = true; 
        "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = true; 
        "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = true; 
        "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = true; 

        "Mod+Page_Down".action.focus-workspace-down = true; 
        "Mod+Page_Up".action.focus-workspace-up = true; 
        "Mod+U".action.focus-workspace-down = true; 
        "Mod+I".action.focus-workspace-up = true; 
        "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = true; 
        "Mod+Ctrl+Page_Up".action.move-column-to-workspace-up = true; 
        "Mod+Ctrl+U".action.move-column-to-workspace-down = true; 
        "Mod+Ctrl+I".action.move-column-to-workspace-up = true; 

        "Mod+Shift+Page_Down".action.move-workspace-down = true; 
        "Mod+Shift+Page_Up".action.move-workspace-up = true; 
        "Mod+Shift+U".action.move-workspace-down = true; 
        "Mod+Shift+I".action.move-workspace-up = true; 

        "Mod+BracketLeft".action.consume-or-expel-window-left = true; 
        "Mod+BracketRight".action.consume-or-expel-window-right = true; 

        "Mod+Comma".action.consume-window-into-column = true; 
        "Mod+Period".action.expel-window-from-column = true;

        "Mod+R".action.switch-preset-column-width = true; 
        "Mod+Shift+R".action.switch-preset-window-height = true; 
        "Mod+Ctrl+R".action.reset-window-height = true; 
        "Mod+F".action.maximize-column = true; 
        "Mod+Shift+F".action.fullscreen-window = true; 

        "Mod+Ctrl+F".action.expand-column-to-available-width = true; 

        "Mod+C".action.center-column = true; 

        "Mod+Ctrl+C".action.center-visible-columns = true; 

        "Mod+Minus".action.set-column-width = "-10%"; 
        "Mod+Equal".action.set-column-width = "+10%"; 

        "Mod+Shift+Minus".action.set-window-height = "-10%"; 
        "Mod+Shift+Equal".action.set-window-height = "+10%"; 

        "Mod+V".action.toggle-window-floating = true; 
        "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = true; 

        "Mod+W".action.toggle-column-tabbed-display = true; 

        "Print".action.screenshot = true; 
        "Ctrl+Print".action.screenshot-screen = true; 
        "Alt+Print".action.screenshot-window = true; 

        "Mod+Escape".action = {
          allow-inhibiting=false;
          toggle-keyboard-shortcuts-inhibit = true; 
        };

        "Mod+Shift+E".action.quit = true; 
        "Ctrl+Alt+Delete".action.quit = true; 

        "Mod+Shift+P".action.power-off-monitors = true;
    
        "Mod+WheelScrollDown".action.focus-workspace-down = true; 
        "Mod+WheelScrollUp".action.focus-workspace-up = true; 
        "Mod+Ctrl+WheelScrollDown".action.move-column-to-workspace-down = true; 
        "Mod+Ctrl+WheelScrollUp".action.move-column-to-workspace-up = true; 

        "Mod+WheelScrollRight".action.focus-column-right = true; 
        "Mod+WheelScrollLeft".action.focus-column-left = true; 
        "Mod+Ctrl+WheelScrollRight".action.move-column-right = true; 
        "Mod+Ctrl+WheelScrollLeft".action.move-column-left = true; 

        "Mod+Shift+WheelScrollDown".action = {
          focus-column-right = true;
          cooldown-ms = 150;
        };

        "Mod+Shift+WheelScrollUp".action = {
          focus-column-left = true; 
          cooldown-ms = 150;
        };

        "Mod+Ctrl+Shift+WheelScrollDown".action.move-column-right = true; 
        "Mod+Ctrl+Shift+WheelScrollUp".action.move-column-left = true;

        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3; 
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9; 

        "Mod+Ctrl+1".action.move-column-to-workspace = 1;
        "Mod+Ctrl+2".action.move-column-to-workspace = 2;
        "Mod+Ctrl+3".action.move-column-to-workspace = 3; 
        "Mod+Ctrl+4".action.move-column-to-workspace = 4;
        "Mod+Ctrl+5".action.move-column-to-workspace = 5;
        "Mod+Ctrl+6".action.move-column-to-workspace = 6;
        "Mod+Ctrl+7".action.move-column-to-workspace = 7;
        "Mod+Ctrl+8".action.move-column-to-workspace = 8;
        "Mod+Ctrl+9".action.move-column-to-workspace = 9; 
      };
    };
  };
}
