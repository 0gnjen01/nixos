{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  # Import the niri module here
  imports = [inputs.niri.nixosModules.niri];

  nixpkgs.overlays = [inputs.niri.overlays.niri];

  programs.niri = {
    enable = true;
    config = ''
      input {
        keyboard.xkb {
          layout "us"
        }
      }
    '';
  };
}
