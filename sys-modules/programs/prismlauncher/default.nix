# MAKE SURE TO USE SYSTEM LIBS IN MC
{
	pkgs,
	lib,
	sys-modules,
	...
}: {
	imports = [ "${sys-modules}/programs/viaproxy" ];
	environment.systemPackages = [
		(pkgs.prismlauncher.override {
			glfw3-minecraft = pkgs.glfw3-minecraft.override {
				withMinecraftPatch = true;
			};
			additionalLibs = with pkgs; map lib.getLib [
				libdecor
				gtk3
				sdl3
			];
		})
	];
}

