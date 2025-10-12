{
   pkgs,
   modules,
   ...
}: {
   imports = [
      "${modules}/programs/steam"
      "${modules}/bases/gui"
      "${modules}/bases/tty"
      "${modules}/virtualization"
   ];

   environment.systemPackages = with pkgs; [
      lutris
      prismlauncher
   ];
}

