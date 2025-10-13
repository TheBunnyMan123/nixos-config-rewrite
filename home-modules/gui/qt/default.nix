{
   pkgs,
   ...
}: {
   qt = {
      enable = true;
      style = {
         name = "kvantum";
         package = pkgs.kdePackages.qtstyleplugin-kvantum;
      };
      platformTheme = {
         name = "qtct";
         package = pkgs.kdePackages.qt6ct;
      };
   };

   home.packages = with pkgs; [
      kdePackages.qtstyleplugin-kvantum
      kdePackages.qt6ct
   ];

   xdg.configFile = {
      "Kvantum/kvantum.kvconfig".text = ''
         [General]
         theme=BreezeDark
      '';

      "Kvantum/BreezeDark".source = "${pkgs.kdePackages.breeze}/share/Kvantum/GraphiteNord";
   };
}

