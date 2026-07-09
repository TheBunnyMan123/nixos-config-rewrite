{
	pkgs,
	fetchzip,
	autoPatchelfHook,
	stoat-desktop,
	stdenv,
	...
}: stdenv.mkDerivation rec {
	pname = "avia-client";
	version = "1.7.1";

	src = fetchzip {
		url = "https://github.com/AvaLilac/for-desktop/releases/download/${version}/AviaClient-linux-x64.zip";
		hash = "sha256-hiq1ghvrVar4ZCDRV1yzasY0ryIx6T+Uz7D4eafHnog=";
	};

	dontBuilt = true;

	nativeBuildInputs = [
		autoPatchelfHook
	];

	buildInputs = with pkgs; [
		nss
		dbus
		atk
		at-spi2-atk
		cups
		cairo
		gtk3
		pango
		libx11
		libxcomposite
		libxdamage
		libxext
		libxfixes
		libxrandr
		libgbm
		expat
		libxcb
		libxkbcommon
		udev
		libgcc
		alsa-lib
	];

	installPhase = ''
		runHook preInstall

		mkdir -p "$out/opt" "$out/bin"
		cp -rL ${stoat-desktop}/share $out/share
		ln -s $out/opt/${pname}/aviaclient-desktop $out/bin/aviaclient-desktop

		cp -r $src "$out/opt/${pname}"

		ls -l

		chmod -R +w $out/share
		find $out/share/applications -name "*.desktop" -exec sed -i "s|Exec=stoat-desktop|Exec=$out/bin/aviaclient-desktop|g" {} \;

		runHook postInstall
	'';
}

