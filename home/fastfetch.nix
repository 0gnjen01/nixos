{ lib, config, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo.source = "nixos_small";
      display = {
        constants = [ "██ " ];
      };      
      modules = [
        {
          key = "{$1}Distro";
          keyColor = "182;100;103";
          type = "os";
        }
        {
          key = "{$1}Kernel";
          keyColor = "140;151;125";
          type = "kernel";
        }
        {
          key = "{$1}Shell";
          keyColor = "38;5;147";
          type = "shell";
        }
        {
          key = "{$1}Packages";
          keyColor = "169;136;176";
          type = "packages";
        }
        {
          key = "{$1}WM";
          keyColor = "141;163;185";
          type = "wm";
        }
        {
          key = "{$1}CPU";
          keyColor = "141;163;185";
          type = "cpu";
        }
        {
          key = "{$1}GPU";
          keyColor = "217;188;140";
          type = "gpu";
        }
      ];
    };
  };
}
