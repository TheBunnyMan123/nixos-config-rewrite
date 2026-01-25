{
	pkgs,
	...
}: {
	imports = [
		./profiles/main
	];

	programs.firefox = {
		enable = true;
		package = pkgs.firefox-esr;
	};
}

