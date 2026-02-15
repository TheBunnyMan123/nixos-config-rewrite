{
	...
}: {
	flake = {
		homeModules = let
			sys-modules = ../../modules;
		in rec {
			bunny = {...}: {
				imports = [
					"${sys-modules}/system/users/bunny"
				];
			};
		};
	};
}

