{
	fetchFromGitLab,
	stdenv,
	pkgs,
	lib,
	...
}: stdenv.mkDerivation rec {
	pname = "hackneyed-cursors";
	version = "0.9.3";

	src = fetchFromGitLab {
		owner = "Enthymeme";
		repo = "hackneyed-x11-cursors";
		rev = version;
		hash = "sha256-gq+qBYm15satH/XXK1QYDVu2L2DvZ+2aYg/wDqncwmA=";
	};

	nativeBuildInputs = with pkgs; [
		jq
		inkscape
		imagemagick
		xcursorgen
	];
	
	makeFlags = [
		"XCURSORGEN=${pkgs.xcursorgen}/bin/xcursorgen"
		"INKSCAPE=${pkgs.inkscape}/bin/inkscape"
		"INSTALL=${pkgs.coreutils}/bin/install"
		"JQ=${pkgs.jq}/bin/jq"
		 "DESTDIR=$(out)"
		 "PREFIX=/"
	];

	postPatch = ''
		echo "Setting up a writable directory for fontconfig cache..."
		export XDG_CACHE_HOME="$(mktemp -d)"

		echo "Patching script shebangs..."
		patchShebangs .
	'';
}

