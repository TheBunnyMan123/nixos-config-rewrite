{
	pkgs,
	lib,
	sys-modules,
	...
}: {
	imports = [
		"${sys-modules}/fonts"
		"${sys-modules}/other/catppuccin"
		"${sys-modules}/programs/tilp"
		"${sys-modules}/programs/hyprland"
		"${sys-modules}/programs/creativity-suite"
		"${sys-modules}/programs/idea"
		"${sys-modules}/system/audio"
		"${sys-modules}/system/audio/pipewire/filtered-mic"
		"${sys-modules}/system/graphics"
		"${sys-modules}/system/input/touchpad"
		"${sys-modules}/system/input/keyboard/gmk67"
		"${sys-modules}/nix"

		"${sys-modules}/bases/tty"
	];

	home-manager.backupFileExtension = "bak";
	home-manager.users.solina.xdg.configFile."niri/display.kdl".source = lib.mkDefault ./display.kdl;

	environment.systemPackages = with pkgs; [
		cemu-ti
		audacity
		mpv

		uv

		tor-browser
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
		wine
		mono
	];
}

