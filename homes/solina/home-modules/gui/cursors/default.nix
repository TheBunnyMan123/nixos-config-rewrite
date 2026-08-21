{
	pkgs,
	packages,
	...
}: {
	home.pointerCursor = {
		enable = true;
		dotIcons.enable = true;
		gtk.enable = true;
		x11.enable = true;
		name = "Hackneyed";
		package = pkgs.callPackage "${packages}/cursors/hackneyed.nix" { animate = false; };
		size = 24;
	};

	home.sessionVariables = {
		XCURSOR_ANIMATE = "false";
	};
}

