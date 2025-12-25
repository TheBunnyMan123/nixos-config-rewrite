{
	pkgs,
	...
}: {
	hardware.openrazer.enable = true;
	users.users.bunny.extraGroups = ["openrazer"];
	environment.systemPackages = with pkgs; [
		openrazer-daemon
		polychromatic
	];
}
