{
	pkgs,
	sys-modules,
	...
}: {
	systemd.services.sculptor = {
		description = "Sculptor backend!";

		after = [ "network.target" "network-online.target" ];
		wants = [ "network-online.target" ];

		serviceConfig = {
			StateDirectory = "sculptor";
			StateDirectoryMode = "0755";
			WorkingDirectory = "/var/lib/sculptor";

			ExecStartPre = ''
${pkgs.coreutils}/bin/cp -n ${pkgs.callPackage "${sys-modules}/../packages/server/sculptor.nix" {}}/bin/sculptor /var/lib/sculptor/sculptor
${pkgs.coreutils}/bin/cp -n ${./Config.toml} /var/lib/sculptor/Config.toml
			'';
			ExecStart = "/var/lib/sculptor/sculptor";
			Restart = "on-failure";

			AmbientCapabilities = "CAP_NET_BIND_SERVICE";
		};

	};

	services.cloudflared = {
		enable = true;

		tunnels = {
			"d4ae47ee-15b1-4f0c-a2dd-529b8e3e8247" = {
				credentialsFile = "/etc/cloudflared-creds/creds";
			};
		};
	};

	networking.firewall.allowedTCPPorts = [ 6665 ];
}

