{
   self,
   inputs,
   ...
}: {
   flake.nixosConfigurations = let
      inherit (inputs.nixpkgs) lib;
      modules = "${self}/modules";
      home-modules = "${self}/home-modules";
      specialArgs = {
         inherit inputs self modules home-modules;
      };
   in {
      desktop = lib.nixosSystem {
         inherit specialArgs;
         modules = [
            "${modules}/system/boot/grub"
            "${modules}/system/boot/efi"

            "${modules}/system/users/bunny"
            "${modules}/home/users/bunny"

            "${modules}/bases/gaming"

            ./hardware-configuration.nix
            ./config.nix
            
            inputs.home-manager.nixosModules.home-manager
            inputs.catppuccin.nixosModules.catppuccin
            { home-manager.extraSpecialArgs = specialArgs; }
         ];
      };
   };
}

