{
   pkgs,
   ...
}: {
   fonts = {
      packages = with pkgs; [
         vista-fonts
         vista-fonts-chs
         vista-fonts-cht

         corefonts
      ];
   };
}

