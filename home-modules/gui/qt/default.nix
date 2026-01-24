{
	pkgs,
	...
}: {
	xdg.configFile = {
		"kdeglobals".text = ''
			[General]
			widgetStyle=kvantum
			ColorScheme=CatppuccinMochaMauve

			[KDE]
			widgetStyle=kvantum
		'';

		"Kvantum/kvantum.kvconfig".text = ''
			[Applications]
			catppuccin-mocha-mauve=.*
		'';

		"Kvantum/catppuccin-mocha-mauve".source = "${pkgs.catppuccin-kvantum.override {
			accent = "mauve";
			variant = "mocha";
		}}/share/Kvantum/catppuccin-mocha-mauve";
	};
}

