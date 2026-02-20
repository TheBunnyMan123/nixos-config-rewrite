{
	pkgs,
	home-modules,
	...
}: let
	packages = with pkgs; [
		vlc
		gthumb
		pcmanfm-qt
		firefox-esr
	];
in {
	imports = [ "${home-modules}/gui/firefox" ];
	home.packages = packages;
	xdg.desktopEntries."pcmanfm-qt-desktop" = {
		name = "Desktop";
		exec = "pcmanfm-qt --desktop";
		settings.Hidden = "true";
	};
	xdg = {
		enable = true;
		mimeApps = {
			enable = true;
			defaultApplicationPackages = packages;
		};
	};
}

