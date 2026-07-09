{
	pkgs,
	homeModules,
	sys-modules,
	lib,
	...
}: let
	avia = pkgs.callPackage "${sys-modules}/../packages/avia-client" {};
in {
	imports = [
		homeModules.altInstances
	];

	homeModules.altInstances."NSFW" = [
		avia
	];

	home.packages = [
		avia
	];
}

