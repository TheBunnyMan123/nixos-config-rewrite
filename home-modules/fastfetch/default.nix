{
	pkgs,
	...
}: {
	home.packages = [
		pkgs.fastfetch
	];

	home.shellAliases.fastfetch = "fastfetch --logo ${./logo.txt}";
	home.file.".config/fastfetch/config.jsonc".source = ./config.jsonc;
}

