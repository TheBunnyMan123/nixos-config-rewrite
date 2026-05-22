{
	pkgs
}: {
	home.packages = with pkgs; [
		(vesktop.overrideAttrs {
			patches = [
				fetchurl {
					url = "https://patch-diff.githubusercontent.com/raw/Vencord/Vesktop/pull/1251.patch";
					hash = "";
				}
			];
		})
	];
}

