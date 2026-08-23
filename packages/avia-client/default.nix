{
	pkgs,
	fetchzip,
	fetchFromGitHub,
	autoPatchelfHook,
	copyDesktopItems,
	makeDesktopItem,
	makeWrapper,
	stdenv,
	asar,
	...
}: let
	desktopItem = makeDesktopItem {
		name = "aviaclient-desktop";
		exec = "aviaclient-desktop";
		icon = "aviaclient-desktop";
		comment = "AviaClient Desktop Application";
		desktopName = "AviaClient";
		genericName = "AviaClient";
		categories = [ "Network" "InstantMessaging" "Chat" ];
	};
in stdenv.mkDerivation rec {
	pname = "avia-client";
	version = "1.8.4";

	src = fetchzip {
		url = "https://github.com/AvaLilac/for-desktop/releases/download/${version}/AviaClient-linux-x64.zip";
		hash = "sha256-c7HnUSPvZIxsQiTyYPvEej7g6RxkBsIW3X61wej5cfg=";
	};
	src2 = fetchFromGitHub {
		owner = "AvaLilac";
		repo = "for-desktop";
		rev = version;
		hash = "sha256-CY4RZUB2p2huqvRw9cCrF5/9PcxkO5MwfJ/uyoXRJlQ=";
	};

	dontBuilt = true;

	nativeBuildInputs = [
		autoPatchelfHook
		copyDesktopItems
		makeWrapper
		asar
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
		libglvnd
	];

	runtimeDependencies = with pkgs; [
		libglvnd
	];

	desktopItems = [ desktopItem ];

	installPhase = ''
		runHook preInstall

		mkdir -p "$out/opt" "$out/bin"
		cp -r $src "$out/opt/${pname}"
		chmod -R +w "$out/opt/${pname}"
		makeWrapper "$out/opt/${pname}/aviaclient-desktop" "$out/bin/aviaclient-desktop" \
			--prefix LD_LIBRARY_PATH : "${pkgs.lib.makeLibraryPath runtimeDependencies}" \
			--add-flags "--disable-features=WebRtcAllowInputVolumeAdjustment"

		mkdir -p "$out/share/icons/hicolor/scalable/apps/"
		cp "$src2/avia_assets/icon.png" "$out/share/icons/hicolor/scalable/apps/aviaclient-desktop.png"

		runHook postInstall
	'';
}

