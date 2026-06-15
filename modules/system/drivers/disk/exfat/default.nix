{
	pkgs,
	...
}: {
	environment.systemPackages = [ pkgs.exfat ];
	boot.supportedFilesystems = [ "exfat" ];
}

