{
	home-modules,
		lib,
		...
}: {
	imports = [
		"${home-modules}/modern-coreutils"
	];

	xdg.configFile = lib.mapAttrs' (name: type: (lib.nameValuePair "kitty/kitty.conf.d/${name}" {
				source = "${./kitty.conf.d}/${name}";
	})) (builtins.readDir ./kitty.conf.d);

	programs.kitty = {
		enable = true;

		font = {
			name = "monospace";
			size = 11;
		};

		shellIntegration = {
			enableZshIntegration = true;
			mode = "no-rc";
		};

		extraConfig = ''
			globinclude ./kitty.conf.d/*.conf
		'';
	};
}

