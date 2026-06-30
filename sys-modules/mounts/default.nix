{
	...
}: {
	fileSystems = {
		"/home/solina/Sync/figura/data/tmp" = rec {
			options = [
				"size=1M"
				"mode=777"
				"noexec"
				"nosuid"
			];
			depends = [ "/home/solina/Sync/figura/data/tmp" ];
			fsType = "tmpfs";
			device = "tmpfs";
		};

		"/home/solina/Sync/figura/data/avatars/niko" = rec {
			device = "/home/solina/Sync/figura/avatars/others/niko";
			options = [ "bind" "ro" ];
			depends = [ device "/home/solina/Sync/figura/data/avatars" ];
			fsType = "auto";
		};

		"/home/solina/Sync/figura/data/avatars/Gen6" = rec {
			device = "/home/solina/Sync/figura/avatars/old/Gen6";
			options = [ "bind" "ro" ];
			depends = [ device "/home/solina/Sync/figura/data/avatars" ];
			fsType = "auto";
		};

		"/home/solina/Sync/figura/data/localonly" = rec {
			device = "/home/solina/Sync/figura/avatars/others/simon/host_only";
			options = [ "bind" "ro" ];
			depends = [ device "/home/solina/Sync/figura/data" ];
			fsType = "auto";
		};

		"/home/solina/Sync/figura/data/avatars/aeliana" = rec {
			device = "/home/solina/Sync/figura/avatars/aeliana";
			options = [ "bind" "ro" ];
			depends = [ device "/home/solina/Sync/figura/data/avatars" ];
			fsType = "auto";
		};
	};
}

