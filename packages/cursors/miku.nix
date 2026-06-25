{
	fetchFromGitHub,
	stdenvNoCC,
	xorg,
	animate ? true,
	lib,
	...
}: stdenvNoCC.mkDerivation {
	name = "miku-cursors";
	src = fetchFromGitHub {
		owner = "supermariofps";
		repo = "hatsune-miku-windows-linux-cursors";
		rev = "471ff88156e9a3dc8542d23e8cae4e1c9de6e732";
		hash = "sha256-HCHo4GwWLvjjnKWNiHb156Z+NQqliqLX1T1qNxMEMfE=";
	};

	dontBuild = true;
	dontConfigure = true;

	nativeBuildInputs = [ xorg.xcursorgen ];

	installPhase = ''
		runHook preInstall

		mkdir -p $out/share/icons
		cp -r $src/miku-cursor-linux $out/share/icons/miku-cursors
	'';

	postInstall = "" + lib.optionalString (!animate) ''
		echo "Disabling cursor animations..."
		find $out/share/icons/miku-cursors/cursors/ -type f -not -type l | while read -r cursor; do
			
	'';
}

