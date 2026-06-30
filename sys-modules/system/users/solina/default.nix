{
	pkgs,
	sys-modules,
	nixModules,
	...
}: {
	imports = [
		"${sys-modules}/programs/zsh"
		"${sys-modules}/programs/obsidian"
		"${sys-modules}/mounts"

		(nixModules.users)
	];

	services.upower.enable = true;

	nixModules.users.solina = {
		description = "BeanGalSolina";
		oldNames = [ "bunny" ];
		hashedPassword = "$y$j9T$E4hYDO/sYjg3hYSTroc5W0$oTFU06Ubm0evVrs/rDlpxQF.RQe8bcBPwPsWxpSe8yC";
		shell = pkgs.zsh;
		sudoer = true;
		uid = 1000;
		homeConfig = "${sys-modules}/../homes/solina";
		groups = [
			"tty"
			"systemd-journal"
			"libvirtd"
			"docker"
			"adbusers"
		];
	};


}

