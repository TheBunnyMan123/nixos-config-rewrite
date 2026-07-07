{
	pkgs,
	pkgsAug2025,
	homeModules,
	...
}: {
	imports = [
		homeModules.altInstances
	];

	home.packages = with pkgs; [
		aseprite
		inkscape
		blender
		ffmpeg
		krita

		kdePackages.kolourpaint
		kdePackages.kdenlive

		pkgsAug2025.blockbench
	];

	homeModules.altInstances."New" = with pkgs; [
		blockbench
	];
}

