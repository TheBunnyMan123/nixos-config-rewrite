{
   pkgs,
   ...
}: {
   gtk = {
      enable = true;
      font.name = "sans-serif";
      theme = {
         name = "Adwaita-dark";
         package = pkgs.gnome-themes-extra;
      };
   };
}

