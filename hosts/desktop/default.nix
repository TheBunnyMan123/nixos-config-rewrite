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
	 pkgsOct2025 = inputs.nixpkgs-oct-11-2025.legacyPackages."x86_64-linux";
         
         #pkgsPatched = import inputs.nixpkgs {
         #   config.allowUnfree = true;
         #   system = "x86_64-linux";
         #   patches = [
         #      (inputs.nixpkgs.lib.fetchpatch {
         #         url = "https://patch-diff.githubusercontent.com/raw/NixOS/nixpkgs/pull/450049.patch";
         #         hash = "";
         #      })
         #   ];
         #};
      };
   in {
      desktop = lib.nixosSystem {
         inherit specialArgs;
         modules = [
            "${sys-modules}/system/boot/grub"
            "${sys-modules}/system/boot/efi"
            "${sys-modules}/system/input/keyboard/razer"

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

