{
	pkgs,
	...
}: {
	environment.systemPackages = with pkgs; [
		jetbrains.idea

		jdk8
		jdk11
		jdk17
		jdk21
		jdk25
		jdk
	];
}

