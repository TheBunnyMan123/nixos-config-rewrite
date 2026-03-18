{
	pkgs,
	pkgsAug2025,
	sys-modules,
	...
}: {
	imports = [
		"${sys-modules}/programs/obs"
	];

	environment.systemPackages = with pkgs; [
		aseprite
		inkscape
		blender
		libreoffice

		kdePackages.kolourpaint

		pkgsAug2025.blockbench
	];

}

