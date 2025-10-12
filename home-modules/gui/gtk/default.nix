{
   pkgs,
   ...
}: {
   xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

   gtk = {
      enable = true;
      font.name = "sans-serif";
      theme = {
         name = "Adwaita-dark";
         package = pkgs.gnome-themes-extra;
      };
   };
}

