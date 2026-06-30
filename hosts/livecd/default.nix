{
	self,
	inputs,
	...
}: {
	flake = let
		inherit (inputs.nixpkgs) lib;
		sys-modules = "${self}/sys-modules";
		packages = "${self}/packages";
		specialArgs = {
			pkgsAug2025 = inputs.nixpkgs-august-2025.legacyPackages."x86_64-linux";
			NixOSUtils = inputs.nixos-utils.nixosModules."x86_64-linux";
			nixModules = self.nixosModules;
			isGui = true;
			isGaming = false;
			inherit inputs sys-modules packages;
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
				"${sys-modules}/system/users/solina"
				"${sys-modules}/services/avahi"
				"${sys-modules}/services/openssh"
				"${sys-modules}/fonts"
				"${sys-modules}/other/catppuccin"
				"${sys-modules}/programs/hyprland"
				"${sys-modules}/programs/creativity-suite"
				"${sys-modules}/system/audio"
				"${sys-modules}/system/graphics"
				"${sys-modules}/system/input/touchpad"
				"${sys-modules}/system/input/keyboard"
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

