{
   pkgs,
   ...
}: {
   programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
   };

   hardware.steam-hardware.enable = true;

   environment.systemPackages = [
      pkgs.steam
      pkgs.steamcmd
   ];
}

