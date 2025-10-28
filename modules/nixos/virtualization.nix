{
  pkgs,
  lib,
  settings,
  ...
}: {
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  programs.virt-manager = {
    enable = true;
  };
  users.users.ignis.extraGroups = ["libvirtd" "kvm"];
}
