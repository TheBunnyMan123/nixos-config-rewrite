{
   ...
}: {
   services.avahi = {
      enable = true;
      openFirewall = true;
      nssmdns4 = true;
      ipv4 = true;
      ipv6 = true;

      publish = {
         enable = true;
         addresses = true;
         workstation = true;
         userServices = true;
      };
   };
}

