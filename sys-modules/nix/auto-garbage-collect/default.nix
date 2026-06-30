{
	...
}: {
	nix.gc = {
		automatic = true;
		options = "--delete-older-than 30d;";
		persistent = true;
		dates = "*-*-01 12:00:00";
	};
}

