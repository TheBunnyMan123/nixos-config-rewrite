{
	pkgs,
	home-modules,
	...
}: let
	packages = with pkgs; [
		mpv
		gthumb
		yazi
		libreoffice
		firefox-esr
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

