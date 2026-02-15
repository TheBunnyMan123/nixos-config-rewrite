{
	pkgs,
	...
}: {
	qt = {
		enable = true;
		style = {
			name = "kvantum";
			package = pkgs.kdePackages.qtstyleplugin-kvantum;
		};
	};

	home.packages = with pkgs; [
		kdePackages.qtstyleplugin-kvantum
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

