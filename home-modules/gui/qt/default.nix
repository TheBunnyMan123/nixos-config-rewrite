{
	pkgs,
	...
}: {
	qt = {
		enable = true;
		platformTheme = {
			name = "qtct";
			package = pkgs.kdePackages.qt6ct;
		};
	};

	home.packages = with pkgs; [
		kdePackages.breeze
		kdePackages.qt6ct
	];

	xdg.configFile = {
		"Kvantum/kvantum.kvconfig".text = ''
			[General]
			theme=BreezeDark
		'';

		"qt6ct/qt6ct.conf".text = ''
			[Fonts]
			fixed="Sans Serif,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
			general="Sans Serif,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"

			[Appearance]
			style=Breeze
			color_scheme=darker
			custom_palette=true
			color_scheme_path=${pkgs.kdePackages.qt6ct}/share/qt6ct/colors/darker.conf
		'';
	};
}

