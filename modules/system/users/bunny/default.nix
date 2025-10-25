{
   pkgs,
   sys-modules,
   home-modules,
   ...
}: {
   imports = [
      "${sys-modules}/programs/zsh"
      "${sys-modules}/programs/obsidian"
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
         "${home-modules}/modern-coreutils"
         "${home-modules}/fastfetch"
         "${home-modules}/neovim"
         "${home-modules}/tmux"
         "${home-modules}/zsh"
         "${home-modules}/git"
      ];
   };
}

