{
   ...
}: {
   services.syncthing = {
      enable = true;
      user = "bunny";
      configDir = "/home/bunny/.config/syncthing";
      guiAddress = "0.0.0.0:8384";
   };
}

