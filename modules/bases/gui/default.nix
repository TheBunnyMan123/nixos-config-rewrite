{
   pkgs,
   modules,
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
   ];
}

