{
	pkgs,
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

	environment.systemPackages = [
		pkgs.steam
			pkgs.steamcmd
	];
}

