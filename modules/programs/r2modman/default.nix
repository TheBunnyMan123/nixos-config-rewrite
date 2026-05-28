{
	config,
	pkgs,
	lib,
	...
}: {
	environment.systemPackages = with pkgs; [
		r2modman
	];
}

