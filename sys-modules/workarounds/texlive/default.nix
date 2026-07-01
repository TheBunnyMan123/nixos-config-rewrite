{
	pkgsAug2025,
	...
}: {
	nixpkgs.overlays = [
		(final: prev: {
			texlivePackages = pkgsAug2025.texlivePackages;
			texlive = pkgsAug2025.texlive;
		})
	];
}

