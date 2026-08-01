{
	sys-modules,
	...
}: {
	imports = [
		"${sys-modules}/nix/ld"
		"${sys-modules}/nix/limits"
		"${sys-modules}/nix/auto-optimise"
		"${sys-modules}/nix/auto-garbage-collect"
	];
}

