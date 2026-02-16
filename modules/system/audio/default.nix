{
	pkgs,
		...
}: {
	security.rtkit.enable = true;
	services = {
		pulseaudio.enable = false;
		pipewire = {
			enable = true;
			pulse.enable = true;
			wireplumber.enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			jack.enable = true;
		};
	};

	environment.systemPackages = with pkgs; [
		pwvucontrol
		qpwgraph
	];
}

