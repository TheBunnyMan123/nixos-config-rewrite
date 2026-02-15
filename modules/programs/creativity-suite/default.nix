{
	pkgs,
	...
}: {
	environment.systemPackages = with pkgs; [
		aseprite
		inkscape
		blender

		kdePackages.kolourpaint
	];
}

