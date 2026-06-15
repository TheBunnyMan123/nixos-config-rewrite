{
	sys-modules,
	...
}: {
	imports = [
		"${sys-modules}/system/drivers/disk/exfat"
		"${sys-modules}/system/drivers/disk/ntfs"
	];
}

