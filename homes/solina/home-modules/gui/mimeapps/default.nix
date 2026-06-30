{
	pkgs,
	userParams,
	config,
	...
}: let
	packages = with pkgs; [
		mpv
		gthumb
		yazi
		libreoffice
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

