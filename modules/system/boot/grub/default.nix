{
   ...
}: {
   boot.loader.grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      
      extraEntries = ''
         menuentry "Next Entry" {
            exit
         }

         menuentry "Power Off" {
            halt
         }

         menuentry "Reboot" {
            reboot
         }
      '';
   };
}

