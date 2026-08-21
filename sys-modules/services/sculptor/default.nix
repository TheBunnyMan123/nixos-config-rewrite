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

			ExecStartPre = "${pkgs.writeShellScriptBin "copy" ''
${pkgs.coreutils}/bin/cp -n ${pkgs.callPackage "${sys-modules}/../packages/server/sculptor.nix" {}}/bin/sculptor /var/lib/sculptor/sculptor
${pkgs.coreutils}/bin/cp -n ${./Config.toml} /var/lib/sculptor/Config.toml
			''}/bin/copy";
			ExecStart = "/var/lib/sculptor/sculptor";
			Restart = "on-failure";

			AmbientCapabilities = "CAP_NET_BIND_SERVICE";
		};
	};

	services.cloudflared = {
		enable = true;

		tunnels."ffb8a89a-cb75-4348-9cb3-08727056da82" = {
			credentialsFile = "/etc/cloudflare-creds/tunnel-figura-sculptor.json";
			default = "http://localhost:6665";
			ingress = {
				"figura-sculptor.beangal.dev" = "http://localhost:6665";
			};
			originRequest.disableChunkedEncoding = true;
		};
	};

	environment.systemPackages = with pkgs; [
		cloudflared
	];
	networking.firewall.allowedTCPPorts = [ 6665 ];
}

