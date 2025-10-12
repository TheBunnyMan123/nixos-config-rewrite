{
   pkgs,
   ...
}: {
   programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
   };

   hardware.steam-hardware.enable = true;

   environment.systemPackages = [
      pkgs.steam
      pkgs.steamcmd
   ];
}

