{
	pkgs,
	lib,
	config,
	home-modules,
	...
}: {
	networking.hostName = "NixOS-LiveCD";
	fonts.fontconfig.enable = lib.mkForce true;
	home-manager.useGlobalPkgs = true;
	home-manager.users.bunny.home.stateVersion = config.system.stateVersion;
	home-manager.users.bunny = {
		imports = [
			"${home-modules}/gui/hyprland"
			"${home-modules}/gui/chromium"
			"${home-modules}/gui/kitty"
			"${home-modules}/gui/vencord"
		];
	};

	nixpkgs.hostPlatform = "x86_64-linux";
	networking.networkmanager.enable = lib.mkForce false;

	services.getty.autologinUser = lib.mkForce "bunny";

	environment.systemPackages = with pkgs; [
		coreutils-full
		git
		fastfetch
		github-cli
		neovim
		fzf
		eza
		rcs
		bat
		w3m
		rofi
		waybar
		swaynotificationcenter
		grim
		slurp
		wl-clipboard
		hypridle
		hyprpaper
		grimblast
		kdePackages.dolphin
	];

	systemd.services.nixos-config = if builtins.pathExists "${../..}/.git" then {
		description = "Copy NixOS config to /etc/nixos";
		wantedBy = ["systemd-tmpfiles-setup.service" "multi-user.target"];
		before = ["systemd-tmpfiles-setup.service"];
		after = ["local-fs.target"];
		
		serviceConfig = {
			Type = "oneshot";
			RemainAfterExit = true;
		};

		script = ''
			mkdir -p /etc/nixos
			cp -rT "${../..}"
			chmod 777 /etc/nixos -R
			chown -R root:root /etc/nixos
		'';
	} else throw "build live cd with `nix build path:#livecd` to include .git directory.";
}

