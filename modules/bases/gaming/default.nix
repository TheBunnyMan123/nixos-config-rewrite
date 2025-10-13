{
   pkgs,
   sys-modules,
   ...
}: {
   imports = [
      "${sys-modules}/programs/steam"
      "${sys-modules}/bases/gui"
      "${sys-modules}/bases/tty"
      "${sys-modules}/virtualization"
   ];

   environment.systemPackages = with pkgs; [
      lutris
      prismlauncher
   ];
}

