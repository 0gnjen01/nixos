{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ignis";
  home.homeDirectory = "/home/ignis";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  imports = [
    ./fuzzel.nix
    ./foot.nix
    ./mako.nix
    ./river.nix
    ./fastfetch.nix
  ];

  home.packages = with pkgs; [
    cowsay
    cava
    btop
    yazi

    foot
    creek
    sway-contrib.grimshot
    wl-clipboard
    wlr-randr 
    wbg
    pavucontrol

    obsidian
    zathura
    pcmanfm

    qemu
    libvirt

    youtube-music
    krita
    prismlauncher
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  
  programs.fish.enable = true;
  home.shell.enableFishIntegration = true;

  programs.firefox = {
    enable = true;
  };

  programs.vesktop = {
    enable = true;
  };

  programs.anki = {
    enable = true;
    addons = [
      pkgs.ankiAddons.review-heatmap
      pkgs.ankiAddons.adjust-sound-volume
    ];
  };

  programs.translate-shell.enable = true;

  programs.ssh = {
    enable = true;
    matchBlocks.ignis.addKeysToAgent = "yes";
  };

  programs.git = {
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
 
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ignis/etc/profile.d/hm-session-vars.sh
  #

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

