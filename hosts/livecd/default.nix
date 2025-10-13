{
   self,
   inputs,
   ...
}: {
   flake = let
      inherit (inputs.nixpkgs) lib;
      sys-modules = "${self}/modules";
      home-modules = "${self}/home-modules";
      specialArgs = {
         inherit inputs sys-modules home-modules;
      };
   in {
      tmp = builtins.trace "${inputs.nixpkgs}";
      nixosConfigurations.livecd = lib.nixosSystem {
         inherit specialArgs;
         modules = [
            (inputs.nixpkgs + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")

            "${sys-modules}/system/networking"
            "${sys-modules}/system/locale"
            "${sys-modules}/system/users"
            "${sys-modules}/system/users/root"
            "${sys-modules}/system/users/bunny"
            "${sys-modules}/home/users/bunny"
            "${sys-modules}/services/avahi"
            "${sys-modules}/services/openssh"
            "${sys-modules}/fonts/all"
            "${sys-modules}/other/catppuccin"
            "${sys-modules}/programs/hyprland"
            "${sys-modules}/system/audio"
            "${sys-modules}/system/graphics"
            "${sys-modules}/system/input/touchpad"
            "${sys-modules}/other/nix"

            ./config.nix

            inputs.home-manager.nixosModules.home-manager
            inputs.catppuccin.nixosModules.catppuccin
            { home-manager.extraSpecialArgs = specialArgs; }
         ];
      };
      
      packages."x86_64-linux".livecd = self.nixosConfigurations.livecd.config.system.build.isoImage;
   };
}

