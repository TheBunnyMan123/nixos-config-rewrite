{
	pkgs,
	...
}: {
	services.pipewire.extraLadspaPackages = [ pkgs.lsp-plugins pkgs.rnnoise-plugin ];
	services.pipewire.extraConfig.pipewire."99-filtered-mic" = {
		"context.modules" = [
			{
				name = "libpipewire-module-loopback";
				args = {
					"node.description" = "Filtered Mic Input";
					"media.name" = "Filtered Mic Input";
					"capture.props" = {
						"node.name" = "filteredmic.capture.filtered_mic_input_source";
						"node.passive" = true;
						"audio.position" = [ "MONO" ];
					};
					"playback.props" = {
						"node.name" = "filteredmic.filtered_mic_input_source";
						"media.class" = "Audio/Source";
						"audio.position" = [ "MONO" ];
						"priority.session" = 0;

						"channelmix.mix-lfe" = true;
						"channelmix.properties" = {
							"channelmix.mapping" = [
								{ "from" = [ "MONO" ]; "to" = [ "FL" "FR" ]; }
							];
						};
					};
				};
			}
			{
				name = "libpipewire-module-filter-chain";
				args = {
					"node.description" = "Filtered Mic - Noise Reduction";
					"media.name" = "Filtered Mic - Noise Reduction";
					"filter.graph" = {
						nodes = [
							{
								type = "ladspa";
								name = "rnnoise";
								plugin = "librnnoise_ladspa";
								label = "noise_suppressor_mono";
								control = {
									"VAD Threshold (%)" = 50.0;
									"VAD Grace Period (ms)" = 200;
									"Retroactive VAD Grace (ms)" = 0;
								};
							}
						];
					};
					"capture.props" = {
						"node.name" = "filteredmic.capture.rnnoise_source";
						"node.passive" = true;
						"audio.rate" = 48000;
						"audio.position" = [ "MONO" ];
						"target.object" = "filteredmic.filtered_mic_input_source";
					};
					"playback.props" = {
						"node.name" = "filteredmic.rnnoise_source";
						"priority.session" = 0;
						"media.class" = "Audio/Source";
						"audio.rate" = 48000;
						"audio.position" = [ "MONO" ];
					};
				};
			}
			{
				name = "libpipewire-module-filter-chain";
				args = {
					"node.description" = "Filtered Mic - Auto Gain Control";
					"media.name" = "Filtered Mic - Auto Gain Control";
					"filter.graph" = {
						nodes = [
							{
								type = "ladspa";
								name = "";
								plugin = "lsp-plugins-ladspa";
								label = "http://lsp-plug.in/plugins/ladspa/autogain_mono";
								control = {
								};
							}
						];
					};
					"capture.props" = {
						"node.name" = "filteredmic.capture.agc_source";
						"node.passive" = true;
						"audio.position" = [ "MONO" ];
						"target.object" = "filteredmic.rnnoise_source";
					};
					"playback.props" = {
						"node.name" = "filteredmic.agc_source";
						"priority.session" = 0;
						"media.class" = "Audio/Source";
						"audio.position" = [ "MONO" ];
					};
				};
			}
			{
				name = "libpipewire-module-loopback";
				args = {
					"node.description" = "Filtered Mic";
					"media.name" = "Filtered Mic";
					"capture.props" = {
						"node.name" = "filteredmic.capture.filtered_mic_source";
						"node.passive" = true;
						"audio.position" = [ "MONO" ];
						"target.object" = "filteredmic.agc_source";
					};
					"playback.props" = {
						"node.name" = "filteredmic.filtered_mic_source";
						"node.volume" = 2.0;
						"media.class" = "Audio/Source";
						"priority.session" = 2000;
						"audio.position" = [ "MONO" ];
					};
				};
			}
		];
	};
}

