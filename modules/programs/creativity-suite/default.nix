{
	pkgs,
	pkgsAug2025,
	...
}: {
	environment.systemPackages = with pkgs; [
		aseprite
		inkscape
		blender
		libreoffice
		obs-studio

		kdePackages.kolourpaint


		pkgsAug2025.blockbench
	];
}

