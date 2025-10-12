{
   pkgs,
   modules,
   home-modules,
   ...
}: {
   imports = [
      "${modules}/fonts/all"
      "${modules}/other/catppuccin"
      "${modules}/programs/tilp"
      "${modules}/programs/hyprland"
      "${modules}/system/audio"
      "${modules}/system/graphics"
      "${modules}/system/input/touchpad"

      "${modules}/bases/tty"
   ];
   
   home-manager.users.bunny = {
      imports = [
         "${home-modules}/gui/hyprland"
         "${home-modules}/gui/chromium"
         "${home-modules}/gui/kitty"
         "${home-modules}/gui/vencord"
      ];
   };

   environment.systemPackages = with pkgs; [
      cemu-ti
      audacity

      rofi
      waybar
      swaynotificationcenter
      grim
      slurp
      wl-clipboard
      hypridle
      hyprpaper
      grimblast
      nwg-look
      nautilus

      aseprite
   ];
}

