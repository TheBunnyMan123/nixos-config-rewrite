{
	pkgs,
	NixOSUtils,
	...
}: {
	programs.firefox = {
		nativeMessagingHosts = [
			pkgs.keepassxc
		];

		profiles.main = {
			id = 0;
			isDefault = true;

			settings = {
				"extensions.autoDisableScopes" = 0;
				"xpinstall.signatures.required" = false;
			};

			search.force = true;
			search.default = "google-search";
			search.engines = {
				google.metaData.hidden = true;
				amazondotcom-us.metaData.hidden = true;
				bing.metaData.hidden = true;
				ddg.metaData.hidden = true;
				perplexity.metaData.hidden = true;
				wikipedia.metaData.hidden = true;
				ebay.metaData.hidden = true;

				google-search = {
					name = "Google Search";
					urls = [
						{
							template = "https://www.google.com/search";
							params = [
								{
									name = "q";
									value = "{searchTerms} -ai";
								}
							];
						}
					];

					icon = "https://www.google.com/favicon.ico";
					updateInterval = 7 * 24 * 60 * 60 * 1000;
					definedAliases = [ "@gs" ];
				};

				google-images = {
					name = "Google Images";
					urls = [
						{
							template = "https://www.google.com/search";
							params = [
								{
									name = "q";
									value = "{searchTerms} -ai";
								}
								{
									name = "udm";
									value = "2";
								}
							];
						}
					];

					icon = "https://www.google.com/favicon.ico";
					updateInterval = 7 * 24 * 60 * 60 * 1000;
					definedAliases = [ "@gi" ];
				};

				youtube = {
					name = "YouTube";
					urls = [
						{
							template = "https://google.com/search";
							params = [
								{
									name = "q";
									value = "site:youtube.com {searchTerms}";
								}
							];
						}
					];

					icon = "https://www.youtube.com/favicon.ico";
					updateInterval = 7 * 24 * 60 * 60 * 1000;
					definedAliases = [ "@yt" ];
				};

				nix-packages = {
					name = "Nix Packages";
					urls = [
						{
							template = "https://search.nixos.org/packages";
							params = [
								{
									name = "query";
									value = "{searchTerms}";
								}
								{
									name = "channel";
									value = "unstable";
								}
							];
						}
					];

					icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
					definedAliases = [ "@np" ];
				};

				nixos-options = {
					name = "NixOS Options";
					urls = [
						{
							template = "https://search.nixos.org/options";
							params = [
								{
									name = "query";
									value = "{searchTerms}";
								}
								{
									name = "channel";
									value = "unstable";
								}
							];
						}
					];

					icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
					definedAliases = [ "@no" ];
				};

				nixos-wiki = {
					name = "NixOS Wiki";
					urls = [
						{
							template = "https://wiki.nixos.org/index.php";
							params = [
								{
									name = "search";
									value = "{searchTerms}";
								}
								{
									name = "title";
									value = "Special:Search";
								}
							];
						}
					];

					icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
					definedAliases = [ "@nw" ];
				};
			};

			extensions = {
				packages = with NixOSUtils; [
					(buildFirefoxAddon {
						name = "keepassxc";
						version = "1.9.11";
						url = "https://github.com/keepassxreboot/keepassxc-browser/releases/download/1.9.11/keepassxc-browser_1.9.11_firefox.zip";
						hash = "sha256-BfJgYPxv3yswvu/RhTQ1O42GrYCdCPiwz1KQFtebI4s=";
						fixedExtid = "keepassxc-browser@keepassxc.org";
					})
					(buildFirefoxAddon {
						name = "ublock";
						version = "1.68.0";
						url = "https://github.com/gorhill/uBlock/releases/download/1.68.0/uBlock0_1.68.0.firefox.signed.xpi";
						hash = "sha256-XK9KvaSUAYhBIioSFWkZu92MrYKng8OMNrIt1kJwQxU=";
					})
					(buildFirefoxAddon {
						name = "sponsorblock";
						version = "6.1.2";
						url = "https://github.com/ajayyy/SponsorBlock/releases/download/6.1.2/FirefoxSignedInstaller.xpi";
						hash = "sha256-3fji3IsIpkkbmDYPU7S3wTG1f5PiopO28bI8NfSwvZw=";
					})
					(buildFirefoxAddon {
						name = "dearrow";
						version = "2.2.3";
						url = "https://github.com/ajayyy/DeArrow/releases/download/2.2.3/FirefoxSignedInstaller.xpi";
						hash = "sha256-x/LsYSN2zz+B8Z9DHnd7UjRQunEcdvVGve9Dh2Fw9Fc=";
					})
				];
			};
		};
	};
}


