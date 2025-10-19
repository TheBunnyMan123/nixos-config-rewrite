{
   pkgs,
   sys-modules,
   home-modules,
   ...
}: {
   imports = [
      "${sys-modules}/fonts/all"
      "${sys-modules}/other/catppuccin"
      "${sys-modules}/programs/tilp"
      "${sys-modules}/programs/hyprland"
      "${sys-modules}/system/audio"
      "${sys-modules}/system/graphics"
      "${sys-modules}/system/input/touchpad"

      "${sys-modules}/bases/tty"
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
      vlc

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

