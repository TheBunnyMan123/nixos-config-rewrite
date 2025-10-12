{
   pkgs,
   ...
}: {
   fonts = {
      packages = with pkgs; [
         vistafonts
         vistafonts-chs
         vistafonts-cht

         corefonts
      ];
   };
}

