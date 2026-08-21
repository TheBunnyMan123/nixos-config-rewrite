{
   ...
}: {
   services.syncthing = {
      enable = true;
      user = "solina";
      configDir = "/home/solina/.config/syncthing";
      guiAddress = "0.0.0.0:8384";
   };
}

