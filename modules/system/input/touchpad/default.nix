{
   ...
}: {
   services.libinput = {
      enable = true;
      touchpad = {
         middleEmulation = false;
         disableWhileTyping = false;
      };
   };
}

