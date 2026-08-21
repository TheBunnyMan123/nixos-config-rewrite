{
	pkgs,
	lib,
	...
}: {
	imports = [
		./profiles/default
	];

	programs.firefox = {
		enable = true;
		package = pkgs.firefox-devedition;
		configPath = ".mozilla/firefox";

		profiles.dev-edition-default.isDefault = lib.mkForce false;
		profiles.dev-edition-default.id = lib.mkForce 1;
	};
}

