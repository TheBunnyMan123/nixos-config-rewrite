{
   pkgs,
   ...
}: {
   security.rtkit.enable = true;
   services = {
      pulseaudio.enable = false;
      pipewire = {
         enable = true;
         pulse.enable = true;
         wireplumber.enable = true;
         alsa.enable = true;
      };
   };

   environment.systemPackages = [
      pkgs.pavucontrol
   ];
}

