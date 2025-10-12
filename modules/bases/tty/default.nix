{
   modules,
   ...
}: {
   home-manager.useGlobalPkgs = true;

   imports = [
      "${modules}/programs/zsh"

      "${modules}/system"
      "${modules}/system/networking"
      "${modules}/system/networking/syncthing"
      "${modules}/system/locale"
      "${modules}/system/users"
      "${modules}/system/users/root"

      "${modules}/services/tailscale"
      "${modules}/services/tmpfiles"
      "${modules}/services/avahi"
      "${modules}/services/cups"
      "${modules}/services/syncthing"
      "${modules}/services/openssh"

      "${modules}/other/nix"
   ];
}

