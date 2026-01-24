{
	pkgs,
	...
}: {
	qt = {
		enable = true;
		style = "kvantum";
	};

	environment.systemPackages = with pkgs; [
		kdePackages.qtstyleplugin-kvantum
		kdePackages.breeze
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
}

