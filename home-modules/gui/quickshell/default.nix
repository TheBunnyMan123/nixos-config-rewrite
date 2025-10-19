{
   ...
}: {
   programs.quickshell = {
      enable = true;
      configs = {
         bar = ./configs/bar;
         shell = ./configs/shell;
      };
   };
}

