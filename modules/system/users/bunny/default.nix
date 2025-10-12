{
   pkgs,
   modules,
   home-modules,
   ...
}: {
   imports = [
      "${modules}/programs/zsh"
   ];

   users.users.bunny = {
      isNormalUser = true;
      home = "/home/bunny";
      description = "TheKillerBunny";
      hashedPassword = "$y$j9T$E4hYDO/sYjg3hYSTroc5W0$oTFU06Ubm0evVrs/rDlpxQF.RQe8bcBPwPsWxpSe8yC";
      shell = pkgs.zsh;
      extraGroups = [
         "wheel"
         "tty"
         "systemd-journal"
         "libvirtd"
         "docker"
         "adbusers"
      ];
   };

   home-manager.users.bunny = {
      imports = [
         "${home-modules}/gui/hyprland"
         "${home-modules}/gui/chromium"
         "${home-modules}/gui/kitty"
         "${home-modules}/gui/vencord"
      ];
   };
}

