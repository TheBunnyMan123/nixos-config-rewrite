{
	...
}: {
	flake.nixosModules = {
		users = ./users;
	};
	flake.homeModules = {
		altInstances = ./hm/altInstances;
	};
}

