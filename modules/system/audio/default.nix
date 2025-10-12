{
   ...
}: {
   services = {
      pulseaudio.enable = false;
      pipewire = {
         enable = true;
         pulse.enable = true;
         jack.enable = true;
         wireplumber.enable = true;
         alsa.enable = true;
      };
   };
}

