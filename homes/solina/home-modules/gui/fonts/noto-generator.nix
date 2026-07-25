{
	pkgs,
	...
}: let
	sans = "Noto Sans [^(Mono)]";
	serif = "Noto Serif";
	mono = "Noto Sans Mono";

	sed = ''s/\([^[:space:]][^\n]*\)/"&"/g; s/\n/ /g'';

	sandboxFontsConf = pkgs.makeFontsConf {
		fontDirectories = with pkgs; [
			noto-fonts
			noto-fonts-cjk-sans
			noto-fonts-cjk-serif
		];
	};

	generated = pkgs.runCommand "noto-string-lists" {
		nativeBuildInputs = with pkgs; [
			fontconfig
		];
	} ''
		export FONTCONFIG_FILE=${sandboxFontsConf}
		export XDG_CACHE_HOME=$TMPDIR/cache
		export FC_CONFIG_DIR=$TMPDIR/fontconfig

		mkdir -p $XDG_CACHE_HOME $FC_CONFIG_DIR
		echo "{" > $out
		echo "sans=[" >> $out
		fc-list : family | grep -E '${sans}[^,]+' | sort | sed -z '${sed}' >> $out
		echo "];serif=[" >> $out
		fc-list : family | grep -E '${serif}[^,]+' | sort | sed -z '${sed}' >> $out
		echo "];mono=[" >> $out
		fc-list : family | grep -E '${mono}[^,]+' | sort | sed -z '${sed}' >> $out
		echo "];}" >> $out
	'';
in import generated

