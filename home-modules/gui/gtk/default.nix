{
   pkgs,
   ...
}: {
   xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

   gtk = rec {
      enable = true;
      font.name = "sans-serif";
      theme = {
         name = "Adwaita-dark";
         package = pkgs.gnome-themes-extra;
      };
      gtk4.theme = theme;
   };
}

