{
	...
}: {
	services.udev.extraRules = ''
		SUBSYSTEM=="input", ATTRS{idVendor}=="20d6", ATTRS{idProduct}=="4001", TAG+="uaccess", ENV{ID_INPUT_JOYSTICK}="1"
		KERNEL=="hidraw*", ATTRS{idVendor}=="20d6", ATTRS{idProduct}=="4001", TAG+="uaccess"
	'';
}

