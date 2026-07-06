{
	pkgs,
	...
}: {
	home.packages = with pkgs; [
		stoat-desktop
	];
}

