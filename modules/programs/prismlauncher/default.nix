# MAKE SURE TO USE SYSTEM LIBS IN MC
{
	pkgs,
	...
}: {
	environment.systemPackages = [
		(pkgs.prismlauncher.override {
			glfw3-minecraft = pkgs.glfw3-minecraft.override {
				withMinecraftPatch = true;
			};
			additionalLibs = with pkgs; [
				libdecor
				gtk3
			];
		})
	];
}

