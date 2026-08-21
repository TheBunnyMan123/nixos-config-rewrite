{
	...
}: {
	services.udev.extraRules = ''
		SUBSYSTEM=="input", ATTRS{idVendor}=="36b0", ATTRS{idProduct}=="3068", ENV{ID_INPUT_JOYSTICK}=""
	'';

	environment.sessionVariables = {
		#SDL_GAMECONTROLLER_IGNORE_DEVICES = "0x36b0/0x3068";
	};
}

