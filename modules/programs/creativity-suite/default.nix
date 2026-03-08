{
	pkgs,
	...
}: {
	environment.systemPackages = with pkgs; [
		aseprite
		inkscape
		blender
		libreoffice
		obs-studio

		kdePackages.kolourpaint
	];
}

