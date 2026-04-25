{
	pkgs,
	config,
	...
}: {
	imports = [
		./profiles/main
	];

	programs.firefox = {
		enable = true;
		package = pkgs.firefox-esr;
		configPath = "${config.xdg.configHome}/mozilla/firefox";
	};
}

