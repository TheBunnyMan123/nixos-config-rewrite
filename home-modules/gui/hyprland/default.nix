{
   pkgs,
   home-modules,
   ...
}: {
   imports = [
      "${home-modules}/gui/gtk"
      "${home-modules}/gui/hypridle"
      "${home-modules}/gui/hyprpaper"
      "${home-modules}/gui/rofi"
      "${home-modules}/gui/waybar"
   ];

   home.pointerCursor = {
      enable = true;
      dotIcons.enable = true;
      gtk.enable = true;
      hyprcursor.enable = true;
      package = pkgs.catppuccin-cursors.mochaMauve;
      name = "catppuccin-mocha-mauve-cursors";
      size = 24;
   };

   programs.zsh.initContent = ''
      if [[ "$(tty)" == "/dev/tty1" ]]
      then
         exec Hyprland
      fi
   '';

   wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.variables = [ "--all" ];

      settings = {
         "$mod" = "SUPER";
         "$mod_alt" = "SUPER_SHIFT";

         general = {
            gaps_in = 5;
            gaps_out = 10;
            border_size = 2;

            "col.inactive_border" = "rgb(1a1a1a)";
            "col.active_border" = "rgb(b3e0f2)";
            layout = "master";

            resize_on_border = false;
            allow_tearing = false;
         };

         decoration = {
            rounding = 10;
            active_opacity = 1.0;
            inactive_opacity = 0.95;

            blur = {
               enabled = true;
               size = 3;
               passes = 1;
               vibrancy = 0.1696;
            };
         };

         input = {
            kb_layout = "us";
            follow_mouse = 1;
            sensitivity = 0;

            touchpad = {
               natural_scroll = false;
               disable_while_typing = false;
            };
         };

         animations = {
            enabled = true;
            bezier = "bez, 0.05, 0.9, 0.1, 1.05";

            animation = [
               "windows, 1, 5, bez"
               "windowsOut, 1, 5, bez"
               "workspaces, 1, 5, bez"

               "border, 0, 0, default"
               "borderangle, 0, 0, default"
               "fade, 0, 0, default"
            ];
         };

         exec-once = [
            "waybar"
            "swaync"
            
            "[workspace 1 silent] 'kitty tmux new -A'"
            "[workspace 2 silent] chromium"
            "[workspace 2 silent] keepassxc"
            "[workspace 3 silent] vesktop"
         ];

         bind = [
            ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ --limit 1 5%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            
            ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
            ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

            "$mod, N, layoutmsg, swapwithmaster master"
            "$mod, B, exec, chromium"
            "$mod, Q, exec, kitty tmux new -A"
            "$mod_alt, Q, exec, kitty"
            "$mod, C, killactive,"
            "$mod, M, exit,"
            "$mod, V, togglefloating,"
            "$mod, R, exec, rofi -show drun"
            "$mod, S, exec, bash -c 'grimblast --freeze copysave area \"$(date +\"$HOME/Picturesscrn-%m-%d-%y-%H-%M-%S.png\")\"'"
            "$mod, D, fullscreen,"
            
            "$mod, L, movefocus, r"
            "$mod, J, movefocus, d"
            "$mod, K, movefocus, u"
            "$mod, H, movefocus, l"
            "$mod, right, movefocus, r"
            "$mod, down, movefocus, d"
            "$mod, up, movefocus, u"
            "$mod, left, movefocus, l"
         ] ++ (
            builtins.concatLists(builtins.genList(
               x: let
                  wspace = let
                     c = (x + 1) / 10;
                  in builtins.toString(x + 1 - (c * 10));
               in [
                  "$mod, ${wspace}, workspace, ${toString(x + 1)}"
                  "$mod_alt, ${wspace}, movetoworkspace, ${toString(x + 1)}"
               ]
            ) 10)
         );

         bindm = [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
         ];

         windowrulev2 = [
            "suppressevent maximize, class:.*"
            "tile, initialClass:([Mm]inecraft.*)"
            "workspace 3, class:(vesktop)"
            
            "float, initialTitle:Picture in Picture"
            "size 544 306, initialTitle:Picture in Picture"
            "move 56 80, initialTitle:Picture in Picture"

            "float, initialClass:org.pulseaudio.pavucontrol"
            "size 600 400, initialClass:org.pulseaudio.pavucontrol"
            "move 15 60, initialClass:org.puuulseaudio.pavucontrol"
         ];

         env = [
            "XCURSOR_SIZE, 24"
            "HYPRCURSOR_SIZE, 24"
            "XCURSOR_THEME, catppuccin-mocha-mauve-cursors"
            "HYPRCURSOR_THEME, catppuccin-mocha-mauve-cursors"

            "GTK_THEME, Adwaita-dark"

            "WLR_NO_HARDWARE_CURSORS, 1"
         ];

         cursor = {
            no_hardware_cursors = true;
         };
      };
   };
}

