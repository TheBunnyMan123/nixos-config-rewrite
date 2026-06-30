{
   ...
}: {
   boot.kernelModules = [ "sg" ];
   boot.kernel.sysctl = { "vm.swappiness" = 15; };
}

