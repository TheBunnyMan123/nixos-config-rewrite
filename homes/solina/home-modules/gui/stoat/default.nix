{
	pkgs,
	homeModules,
	...
}: {
	imports = [
		homeModules.altInstances
	];

	homeModules.altInstances."NSFW" = with pkgs; [
		stoat-desktop
	];

	home.packages = with pkgs; [
		stoat-desktop
	];
}

