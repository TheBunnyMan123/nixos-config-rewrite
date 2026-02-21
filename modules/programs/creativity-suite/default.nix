{
	pkgs,
	...
}: {
	environment.systemPackages = with pkgs; [
		aseprite
		inkscape
		blender
		libreoffice

		kdePackages.kolourpaint
	];
}

