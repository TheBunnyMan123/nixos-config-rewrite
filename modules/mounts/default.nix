{
	...
}: {
	fileSystems = {
		"/home/bunny/Sync/figura/data/tmp" = rec {
			options = [
				"size=1M"
				"mode=777"
				"noexec"
				"nosuid"
			];
			depends = [ "/home/bunny/Sync/figura/data/tmp" ];
			fsType = "tmpfs";
			device = "tmpfs";
		};

		"/home/bunny/Sync/figura/data/avatars/niko" = rec {
			device = "/home/bunny/Sync/figura/avatars/others/niko";
			options = [ "bind" "ro" ];
			depends = [ device "/home/bunny/Sync/figura/data/avatars" ];
			fsType = "auto";
		};

		"/home/bunny/Sync/figura/data/avatars/Gen6" = rec {
			device = "/home/bunny/Sync/figura/avatars/old/Gen6";
			options = [ "bind" "ro" ];
			depends = [ device "/home/bunny/Sync/figura/data/avatars" ];
			fsType = "auto";
		};

		"/home/bunny/Sync/figura/data/avatars/aeliana" = rec {
			device = "/home/bunny/Sync/figura/avatars/aeliana";
			options = [ "bind" "ro" ];
			depends = [ device "/home/bunny/Sync/figura/data/avatars" ];
			fsType = "auto";
		};
	};
}

