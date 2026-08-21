{
	config,
	pkgs,
	lib,
	...
}: {
	imports = [
		./profiles/default
	];

	programs.firefox = {
		enable = true;
		package = pkgs.firefox-devedition.override {
			extraPrefs = ''
				${builtins.readFile ./goodgirl.js}
			'';
			extraAutoConfig = ''
				pref("general.config.sandbox_enabled", false);
			'';
		};
		configPath = "${config.xdg.configHome}/mozilla/firefox";

		profiles.dev-edition-default.isDefault = lib.mkForce false;
		profiles.dev-edition-default.id = lib.mkForce 1;
	};
}

