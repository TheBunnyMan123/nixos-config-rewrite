{
   pkgs,
   ...
}: {
   fonts = {
      packages = with pkgs; [
         twitter-color-emoji
      ];
   };
}

