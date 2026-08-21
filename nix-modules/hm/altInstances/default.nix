{
	config,
	pkgs,
	lib,
	...
}: let
	cfg = config.homeModules.altInstances;
	wrapWithPrefix = prefix: pkg: pkgs.runCommand "alt-${prefix}-${lib.getName pkg}" {
		nativeBuildInputs = [ pkgs.makeWrapper ];
	} ''
		mkdir -p "$out/bin" "$out/share/applications"

		if [ -d "${pkg}/bin" ]; then
			for binPath in ${pkg}/bin/*; do
				if [ -x "$binPath" ]; then
					binName=$(basename "$binPath")
					wrapper="$out/bin/${prefix}-$binName"

					cp "${./wrapper.sh}" "$wrapper"
					chmod +w "$wrapper"

					sed -i "s|@PREFIX@|${prefix}|g" "$wrapper"
					sed -i "s|@BWRAP@|${pkgs.bubblewrap}/bin/bwrap|g" "$wrapper"
					sed -i "s|@ORIG_BIN@|$binPath|g" "$wrapper"

					chmod +x "$wrapper"
				fi
			done
		fi

		if [ -d "${pkg}/share/applications" ]; then\
			for desktopLink in ${pkg}/share/applications/*.desktop; do
				fileName=$(basename "$desktopLink")
				newDesktop="$out/share/applications/${prefix}-$fileName"

				origDesktop=$(readlink -f "$desktopLink")
				
				cp "$origDesktop" "$newDesktop"
				chmod +w "$newDesktop"

				sed -i "s/^Name=\(.*\)/Name=\1 (${prefix})/g" "$newDesktop"

				if [ -d "$out/bin" ]; then
					for wrappedBin in "$out/bin/"*; do
						wrapperBase="$(basename "$wrappedBin")"
						rawBinName="''${wrapperBase#${prefix}-}"
						newExecPath="$out/bin/''${wrapperBase}"
						
						sed -i -E "s|Exec=(.*?/)?''${rawBinName}|Exec=$newExecPath|g" "$newDesktop"
					done
				fi
			done
		fi
	'';
in {
	options.homeModules.altInstances = lib.mkOption {
		description = "Alternate instances of packages";
		default = {};

		type = lib.types.attrsOf (lib.types.listOf lib.types.package);
	};

	config = {
		home.packages = lib.flatten (
			lib.mapAttrsToList (prefix: pkgList: 
				map (pkg: wrapWithPrefix prefix pkg) pkgList
			) cfg
		);
	};
}

