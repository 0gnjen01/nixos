{...}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo.source = "nixos_small";
      display = {
        constants = ["██ "];
      };
      modules = [
        {
          key = "{$1}Distro";
          keyColor = "red";
          type = "os";
        }
        {
          key = "{$1}Kernel";
          keyColor = "green";
          type = "kernel";
        }
        {
          key = "{$1}Shell";
          keyColor = "default";
          type = "shell";
        }
        {
          key = "{$1}Packages";
          keyColor = "magenta";
          type = "packages";
        }
        {
          key = "{$1}WM";
          keyColor = "blue";
          type = "wm";
        }
        {
          key = "{$1}CPU";
          keyColor = "yellow";
          type = "cpu";
        }
        {
          key = "{$1}GPU";
          keyColor = "cyan";
          type = "gpu";
        }
      ];
    };
  };
}
