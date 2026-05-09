{
	pkgs,
	...
}: {
	home.packages = with pkgs; [
		imagemagick
		pngquant
	];
}

