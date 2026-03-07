{
	home-modules,
	pkgs,
	lib,
	...
}: {
	imports = [
		"${home-modules}/gui/hyprpaper"
		"${home-modules}/gui/kitty"
		"${home-modules}/gui/firefox"
		"${home-modules}/gui/quickshell"
		"${home-modules}/gui/rofi"
		"${home-modules}/gui/gtk"
		"${home-modules}/gui/qt"
	];
	
	xdg.portal = {
		extraPortals = [
			pkgs.xdg-desktop-portal-termfilechooser
			pkgs.xdg-desktop-portal-gtk
			pkgs.xdg-desktop-portal-gnome
		];

		config.niri = {
			default = "termfilechooser;gtk;gnome";
			"org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
		};
	};
	
	home.pointerCursor = {
		enable = true;
		dotIcons.enable = true;
		gtk.enable = true;
		package = pkgs.catppuccin-cursors.mochaMauve;
		name = "catppuccin-mocha-mauve-cursors";
		size = 24;
	};
	
	programs.zsh.initContent = lib.mkBefore ''
		if [[ "$(tty)" == "/dev/tty1" ]]
		then
			exec niri-session
		fi
	'';

	home.packages = with pkgs; [
		niri
		dconf
		xwayland-satellite
	];

	xdg.enable = true;
	xdg.configFile.niri.source = ./conf;
}

