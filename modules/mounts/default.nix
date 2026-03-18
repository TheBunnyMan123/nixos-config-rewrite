{
	...
}: {
	fileSystems = {
		"/home/bunny/Sync/figura/data/avatars/niko" = rec {
			device = "/home/bunny/Sync/figura/avatars/niko";
			options = [ "bind" "ro" ];
			depends = [ device "/home/bunny/Sync/figura/data/avatars" ];
		};

		"/home/bunny/Sync/figura/data/avatars/Gen6" = rec {
			device = "/home/bunny/Sync/figura/avatars/Gen6";
			options = [ "bind" "ro" ];
			depends = [ device "/home/bunny/Sync/figura/data/avatars" ];
		};
	};
}

