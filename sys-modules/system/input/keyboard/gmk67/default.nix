{
	pkgs,
	...
}: {
	environment.systemPackages = [(pkgs.callPackage ./udev.nix {})];
}

