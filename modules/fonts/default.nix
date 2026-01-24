{
	sys-modules,
	...
}: {
	imports = [
		"${sys-modules}/fonts/twemoji"
		"${sys-modules}/fonts/noto"
		"${sys-modules}/fonts/nerd"
		"${sys-modules}/fonts/ms"
	];

	fonts.fontconfig = {
		antialias = true;
		hinting.enable = true;
		
		defaultFonts = {
			sansSerif = [ "Arial" "Symbols Nerd Font" "Noto Color Emoji" ];
			serif = [ "Liberation Serif" "Symbols Nerd Font" "Noto Color Emoji" ];
			monospace = [ "MesloLGS Nerd Font" "Noto Color Emoji" ];
		};
	};
}

