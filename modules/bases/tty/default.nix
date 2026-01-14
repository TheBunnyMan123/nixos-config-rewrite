{
   sys-modules,
   ...
}: {
   home-manager.useGlobalPkgs = true;
   services.flatpak.enable = true;

   imports = [
      "${sys-modules}/programs/zsh"

      "${sys-modules}/virtualization/docker"

      "${sys-modules}/system"
      "${sys-modules}/system/networking"
      "${sys-modules}/system/networking/syncthing"
      "${sys-modules}/system/locale"
      "${sys-modules}/system/users"
      "${sys-modules}/system/users/root"
      "${sys-modules}/system/input/keyboard"

      "${sys-modules}/services/tailscale"
      "${sys-modules}/services/tmpfiles"
      "${sys-modules}/services/avahi"
      "${sys-modules}/services/cups"
      "${sys-modules}/services/syncthing"
      "${sys-modules}/services/openssh"

      "${sys-modules}/other/nix"
   ];
}

