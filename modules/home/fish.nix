{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    grc
  ];

  programs.fish = {
    enable = true;
  };

  users.users.ignis = {
    shell = pkgs.fish;
  };

  home-manager.users.ignis = {
    programs.fish = {
      enable = true;
      shellAliases = {
        "dict" = "dict.cc.py";
      };
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
      plugins = [
        {
          name = "grc";
          src = pkgs.fishPlugins.grc.src;
        }
        {
          name = "done";
          src = pkgs.fishPlugins.done.src;
        }
      ];
    };
  };
}
