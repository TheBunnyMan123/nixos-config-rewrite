{
	pkgs,
	...
}: {
	home.packages = with pkgs; [
		gpu-screen-recorder
	];

	home.file.".bin/replaybuf-dump.sh" = {
		source = ./dump.sh;
		executable = true;
	};

	home.file.".bin/replaybuf-start.sh" = {
		source = ./start.sh;
		executable = true;
	};

	systemd.user.services.replay-buffer = {
		Unit = {
			Description = "GPU Screen Recorder Replay Buffer";
			After = [ "graphical-session.target" ];
			PartOf = [ "graphical-session.target" ];
		};

		Service = {
			Environment = "PATH=${pkgs.lib.makeBinPath [ pkgs.coreutils pkgs.gpu-screen-recorder ]}";
			Type = "simple";
			ExecStart = "${pkgs.bash}/bin/bash -i ${./start.sh}";
			Restart = "always";
			RestartSec = 3;
		};

		Install = {
			WantedBy = [ "graphical-session.target" ];
		};
	};
}

