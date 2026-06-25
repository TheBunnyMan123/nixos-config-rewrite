{
	stdenvNoCC,
	curl,
	jq,
	perl,
	unzip,
	lib,
	...
}: {
	projectId,
	assetId,
	hash ? lib.fakeHash,
	...
}: stdenvNoCC.mkDerivation {
	name = "gnome-look-${projectId}-${assetId}";

	outputHash = hash;
	outputHashMode = "recursive";

	nativeBuildInputs = [
		curl
		jq
		perl
		unzip
	];

	dontUnpack = true;
	dontConfigure = true;
	dontBuild = true;

	installPhase = ''
		echo "Fetching gnome-look project ${projectId}, asset ${assetId}"
		curl -sLk "http://www.gnome-look.org/p/${projectId}/loadFiles" \
			| jq -r '.files.[] | select(.id == "${assetId}").url' \
			| perl -pe 's/\%(\w\w)/chr hex $1/ge' \
			| xargs curl -Lko archive.zip
		unzip archive.zip -d $out
	'';
}

