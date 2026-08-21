{
	pkgs,
	userParams,
	config,
	...
}: let
	packages = with pkgs; [
		smplayer
		libreoffice
		gthumb
		yazi
		config.programs.firefox.package
	];
in {
	imports = [ "${userParams.solina.home-modules}/gui/firefox" ];
	home.packages = packages;
	xdg = {
		enable = true;
		mimeApps = {
			enable = true;
			defaultApplicationPackages = packages;
		};
	};
}

