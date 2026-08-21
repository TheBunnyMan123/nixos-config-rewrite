{
	pkgs ? import <nixpkgs>,
	rustPlatform,
	fetchFromGitHub,
	pkg-config,
	...
}: rustPlatform.buildRustPackage rec {
	pname = "sculptor";
	version = "0.4.2";

	src = fetchFromGitHub {
		owner = "shiroyashik";
		repo = "sculptor";
		rev = "v${version}";
		hash = "sha256-mkKs10UWEUGtHvYM7/ZpssrRyO4S9sWFLNgAjjyPx50=";
	};

	nativeBuildInputs = [
		pkg-config
		rustPlatform.bindgenHook
	];

	cargoHash = "sha256-izbmiaA5pRJTYxMTJIDp/j4fnHlgDYs6/7gIs28l3kM=";
}

