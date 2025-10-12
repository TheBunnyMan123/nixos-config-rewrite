{
   ...
}: {
   networking = {
      wireless = {
         enable = true;
         networks = {
            "Nacho WiFi" = {
               pskRaw = "68ab5f9da6b1f9483e4ab7cd0bfc56359d733ef32d735a9b11140aac9985e327";
            };
            "ATTRq4S5nw" = {
               pskRaw = "ee052e671e0c9a90795c6043325eaa6f533d5a483296d8dd960f343ebbde9aa4";
            };
            "Secret Bathroom Camera #3" = {
               psk = "hotspots";
            };
         };
      };

      nat = {
         enable = true;
         internalInterfaces = [ ];
         externalInterface = "wlp4s0";
         enableIPv6 = true;
      };

      nameservers = [
         "100.100.100.100"
         "1.1.1.1"
         "1.0.0.1"
         "8.8.8.8"
         "8.8.4.4"
      ];

      search = [ "kamorri-ghoul.ts.net" ];

      firewall = {
         enable = true;
         allowedTCPPorts = [
            22
            80
            443
         ];
      };
   };
}

