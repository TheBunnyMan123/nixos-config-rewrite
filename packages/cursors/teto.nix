{
	pkgs,
	callPackage,
	stdenv,
	...
}: let
	fetchFromGnomeLook = callPackage ./fetchers/gnomeLook.nix {};
in stdenv.mkDerivation {
	name = "teto-cursors";
	src = fetchFromGnomeLook {
		projectId = "2116993";
		assetId = "1703726204";
		hash = "sha256-FUWbDPpju/gOYhpKUKw1TmtQ2cSwL8DUvSSTLhVyp1M=";
	};

	dontBuild = true;
	dontConfigure = true;

	installPhase = ''
		runHook preInstall

		mkdir -p $out/share/
		cp -r $src $out/share/icons/
	'';
}

