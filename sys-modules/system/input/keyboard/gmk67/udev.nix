{
	stdenv,
	...
}: stdenv.mkDerivation {
	name = "gmk67-udev";
	src = ./rules;
	dontBuild = true;
	dontConfigure = true;
	installPhase = ''
		mkdir -p $out/lib/udev/rules.d
		cp gmk67.rules $out/lib/udev/rules.d
	'';
}

