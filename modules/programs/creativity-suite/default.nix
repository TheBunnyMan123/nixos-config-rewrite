{
	pkgs,
	...
}: {
	environment.systemPackages = with pkgs; [
		aseprite
		inkscape
		blender
		libreoffice-qt6

		kdePackages.kolourpaint
	];
}

