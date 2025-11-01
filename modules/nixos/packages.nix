{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    libnotify
    dict-cc-py
    rtorrent
    swayimg
    inputs.self.packages.${pkgs.stdenv.system}.default
  ];

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];

  security = {
    rtkit.enable = true;
  };

  services = {
    pipewire = {
      enable = true;
      wireplumber.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    playerctld.enable = true;

    displayManager.ly.enable = true;

    flatpak.enable = true;
  };

  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/ignis/flake"; # sets NH_OS_FLAKE variable for you
    };

    thunar = {
      enable = true;
    };

    thunderbird = {
      enable = true;
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    gamemode = {
      enable = true;
    };
  };
}
