{
	pkgs,
	NixOSUtils,
	...
}: {
	programs.firefox = {
		enable = true;
		package = pkgs.firefox-devedition;
	};
}

