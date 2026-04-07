{
   self,
   inputs,
   ...
}: {
   flake.nixosConfigurations = let
      inherit (inputs.nixpkgs) lib;
      sys-modules = "${self}/modules";
      home-modules = "${self}/home-modules";
      specialArgs = {
         inherit inputs self sys-modules home-modules;
	 pkgsAug2025 = inputs.nixpkgs-august-2025.legacyPackages."x86_64-linux";
	 NixOSUtils = inputs.nixos-utils.nixosModules."x86_64-linux";
      };
   in {
      laptop = lib.nixosSystem {
         inherit specialArgs;
         modules = [
            "${sys-modules}/system/boot/grub"
            "${sys-modules}/system/boot/efi"

            "${sys-modules}/system/users/bunny"
            "${sys-modules}/home/users/bunny"

            "${sys-modules}/bases/gaming"

            ./hardware-configuration.nix
            ./config.nix
            
            inputs.home-manager.nixosModules.home-manager
            inputs.catppuccin.nixosModules.catppuccin
            { home-manager.extraSpecialArgs = specialArgs; }
         ];
      };
   };
}

