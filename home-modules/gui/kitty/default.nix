{
   home-modules,
   ...
}: {
   imports = [
      "${home-modules}/modern-coreutils"
   ];

   home.file.".config/kitty/kitty.conf.d".source = "${./kitty.conf.d}";

   programs.kitty = {
      enable = true;

      font = {
         name = "monospace";
         size = 11;
      };

      shellIntegration = {
         enableZshIntegration = true;
         mode = "no-rc";
      };

      extraConfig = ''
         globinclude ./kitty.conf.d/*.conf
      '';
   };
}

