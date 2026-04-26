{
	pkgs,
	home-modules,
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
	imports = [ "${home-modules}/gui/firefox" ];
	home.packages = packages;
	xdg = {
		enable = true;
		mimeApps = {
			enable = true;
			defaultApplicationPackages = packages;
		};
	};
}

