{
   pkgs,
   ...
}: {
   xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
   };

   programs.hyprland.enable = true;
}

