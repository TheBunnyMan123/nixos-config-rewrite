{
	config,
	pkgs,
	lib,
	...
}: {
	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		localNetworkGameTransfers.openFirewall = true;
		extraCompatPackages = with pkgs; [
			proton-ge-bin
			steam-play-none
		];
	};

	hardware.steam-hardware.enable = true;

	environment.variables.STEAM_EXTRA_COMPAT_TOOLS_PATHS = lib.makeSearchPathOutput "steamcompattool" "" config.programs.steam.extraCompatPackages;
	environment.systemPackages = [
		pkgs.steam
		pkgs.steamcmd
	];
}

