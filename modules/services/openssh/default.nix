{
	pkgs,
	lib,
	...
}: {
	services.openssh = {
		enable = true;
		settings.PermitRootLogin = lib.mkForce "no";
	};

	environment.systemPackages = [
		pkgs.sshfs
	];
}

