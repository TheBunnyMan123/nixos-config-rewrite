{
   ...
}: {
   services.syncthing = {
      enable = true;
      user = "solina";
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

