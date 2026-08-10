{
	pkgs,
	...
}: {
	services.pipewire.extraLadspaPackages = [ pkgs.lsp-plugins pkgs.rnnoise-plugin ];
	services.pipewire.extraConfig.pipewire."99-filtered-mic" = {
		"context.modules" = [
			{
				name = "libpipewire-module-filter-chain";
				args = {
					"node.description" = "Filtered Mic";
					"media.name" = "Filtered Mic";
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
							{
								type = "ladspa";
								name = "lsp_gate";
								plugin = "lsp-plugins-ladspa";
								label = "http://lsp-plug.in/plugins/ladspa/gate_mono";
								control = {
									"Curve threshold (G)" = 0.075;
									"Hysteresis threshold (G)" = 0.005;
									"Attack (ms)" = 5.0;
									"Hold time (ms)" = 100.0;
									"Release (ms)" = 200.0;
									"Reduction (G)" = 0.001;
								};
							}
							{
								type = "ladspa";
								name = "agc";
								plugin = "lsp-plugins-ladspa";
								label = "http://lsp-plug.in/plugins/ladspa/autogain_mono";
								control = {
								};
							}
						];

						links = [
							{ output = "rnnoise:Output"; input = "lsp_gate:Input"; }
							{ output = "lsp_gate:Output"; input = "agc:Input"; }
						];

						inputs  = [ "rnnoise:Input" ];
						outputs = [ "agc:Output" ];
					};

					"capture.props" = {
						"node.name"     = "filteredmic.stack_input";
						"node.passive"  = false;
						"audio.rate"    = 48000;
						"audio.position" = [ "MONO" ];
					};

					"playback.props" = {
						"node.name"        = "filteredmic.stack_output";
						"node.description" = "Filtered Mic";
						"media.class"      = "Audio/Source";
						"priority.session" = 2000;
						"audio.rate"       = 48000;
						"audio.position"   = [ "MONO" ];
					};
				};
			}
		];
	};
}

