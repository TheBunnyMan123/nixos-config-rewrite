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
		ffmpeg
		krita

		kdePackages.kolourpaint
		kdePackages.kdenlive

		pkgsAug2025.blockbench
	];

}

