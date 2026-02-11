{
	sys-modules,
	...
}: {
	imports = [
		"${sys-modules}/nix/auto-optimise"
		"${sys-modules}/nix/auto-garbage-collect"
	];
}

