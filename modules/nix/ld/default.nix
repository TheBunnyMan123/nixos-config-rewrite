{
	pkgs,
	...
}: {
	programs.nix-ld = {
		enable = true;
		libraries = with pkgs; [
			(runCommand "steamrun-lib" {} "mkdir $out; ln -s ${steam-run.fhsenv}/usr/lib64 $out/lib")
		];
	};
}

