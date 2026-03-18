{
	pkgs,
	lib,
	sys-modules,
	home-modules,
		...
}: {
	imports = [
		"${sys-modules}/fonts"
		"${sys-modules}/other/catppuccin"
		"${sys-modules}/programs/tilp"
		"${sys-modules}/programs/hyprland"
		"${sys-modules}/programs/creativity-suite"
		"${sys-modules}/system/audio"
		"${sys-modules}/system/graphics"
		"${sys-modules}/system/input/touchpad"
		"${sys-modules}/system/input/keyboard/gmk67"
		"${sys-modules}/nix"

		"${sys-modules}/bases/tty"
	];

	home-manager.users.bunny = {
		imports = [
			"${home-modules}/gui/mimeapps"
			"${home-modules}/gui/niri"
			"${home-modules}/gui/chromium"
			"${home-modules}/gui/firefox"
			"${home-modules}/gui/kitty"
			"${home-modules}/gui/vencord"
		];
	};

	home-manager.backupFileExtension = "bak";
	home-manager.users.bunny.xdg.configFile."niri/display.kdl".source = ./display.kdl;

	environment.systemPackages = with pkgs; [
		cemu-ti
		audacity
		mpv

		rofi
		waybar
		swaynotificationcenter
		grim
		slurp
		wl-clipboard
		hypridle
		hyprpaper
		grimblast
		nwg-look

		keepassxc
	];
}

