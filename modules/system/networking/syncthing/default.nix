{
   ...
}: {
   services.syncthing = {
      enable = true;
      user = "bunny";
   };

   networking.firewall = {
      allowedTCPPorts = [
         22000
      ];
      
      allowedUDPPorts = [
         22000
         21027
      ];
   };
}

