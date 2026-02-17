{
	pkgs,
	...
}: {
	qt = rec {
		enable = true;
		platformTheme = {
			name = "qtct";
			package = pkgs.kdePackages.qt6ct;
		};
		qt5ctSettings = {
			Appearance = {
				style = "kvantum-dark";
				standard_dialogs = "xdgdesktopportal";
				icon_theme = "breeze-dark";
			};
			Fonts = rec {
				fixed = "sans-serif,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
				general = fixed;
			};
		};
		qt6ctSettings = qt5ctSettings;
	};

	home.packages = with pkgs; [
		catppuccin-qt5ct
		kdePackages.qt6ct
		kdePackages.breeze-icons
		kdePackages.qtstyleplugin-kvantum
		libsForQt5.qt5ct
		libsForQt5.qtstyleplugin-kvantum
		(catppuccin-kde.override {
			accents = ["mauve"];
			flavour = ["mocha"];
		})
		(catppuccin-kvantum.override {
			accent = "mauve";
			variant = "mocha";
		})
	];

	xdg.configFile = {
		"dolphinrc".text = ''
			[MainWindow]
			MenuBar=Disabled

			[UiSettings]
			ColorScheme=Kvantum
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

