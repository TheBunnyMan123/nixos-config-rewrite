{
   pkgs,
   ...
}: {
   programs.waybar = {
      enable = true;
      
      settings = {
         mainBar = {
            layer = "top";
            height = 55;

            modules-left = [ "hyprland/workspaces" "clock" "pulseaudio" ];
            modules-right = [ "network" "memory" "disk" "idle_inhibitor" "battery" "tray" ];
            
            "hyprland/workspaces" = {
               active-only = false;
               format = "{icon}";
               tooltip-format = "{windows}";
               format-window-separator = " ";
            };

            "idle_inhibitor" = {
               format = "{icon}";
               tooltip-format-activated = "Inhibiting Idle";
               tooltip-format-deactivated = "Not Inhibiting Idle";
               formaat-icons = {
                  activated = "󰖨";
                  deactivated = "󰢠";
               };
            };

            "disk" = {
               interval = 30;
               format = "  {percentage_used}%";
            };

            "memory" = {
               interval = 30;
               format = "   {percentage}%";
               tooltip-format = "{used}/{total} GiB Used\nSwap: {swapUsed}/{swapTotal} GiB Used";
            };

            "network" = {
               format = "  {essid}";
               format-disconnected = "󰤭";
               format-wifi = "{icon}  {essid}";
               format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];

               on-click = "xterm -class netman -e nmtui";

               format-ethernet = "󰈀  {essid}";

               tooltip-format = "Interface: {ifname}\nIP: {ipaddr}\nSSID: {essid}\nStrength Strength: {signaldBm} dBm\nFrequency: {frequency}\nBandwidth: {bandwidthUpBits}  {bandwidthDownBits}  bits";
            };

            "tray" = {
               icon-size = 15;
               spacing = 3;
            };

            "clock" = {
               timezone = "America/Chicago";
               tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
               format-alt = "  {:%m/%d/%Y}";
               format = "󰥔  {:%I:%M %p}";
            };

            "battery" = {
               states = {
                  warning = 30;
                  critical = 15;
               };
               format = "{icon} {capacity}%";
               format-charging = "󰂄 {capacity}%";
               format-alt = "{icon} {capacity}%";
               max-volume = 100.0;
               reverse-scrolling = 1;
               format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            };

            "pulseaudio" = {
               format = "󰓃 {volume}%";
               format-muted = "󰓄 {volume}%";
               on-click-right = "${pkgs.pavucontrol}/bin/pavucontrol";
            };
         };
      };
         
      style = ''
         * {
            color: rgb(0.1, 0.1, 0.1);
            font-family: sans-serif;
            transition: 0.5s;
         }

         window#waybar {
            background: transparent;
         }

         .modules-left, .modules-right {
            background-color: rgba(0.1, 0.1, 0.1, 0.1);
            margin: 10px;
            padding: 0;
            border-radius: 15px;
         }

         .modules-left * {
            margin: 5px;
         }
         .modules-right * {
            margin: 5px;
         }

         #workspaces {
            margin: 0;
            padding: 0;
            font-family: "monospace";
         }

         #workspaces button {
            margin: 0;
            padding: 0;
            padding-left: 2px;
            padding-right: 2px;
            margin-left: 3px;
            margin-right: 3px;
            background-color: rgba(0.1, 0.1, 0.1, 0.1);
            border-radius: 15px;
         }

         #workspaces button * {
            padding: 0;
            margin: 0;
            color: rgb(1, 1, 1);
            margin-left: 3px;
            margin-right: 3px;
         }

         #workspaces button.active {
            background-color: rgba(1, 1, 1, 0.1);
         }

         #workspaces button.active * {
            color: rgb(0.1, 0.1, 0.1);
         }

         #workspaces button:hover {
            background-color: rgba(1, 1, 1, 0.1);
         }

         #workspaces button:hover * {
            color: rgb(0.1, 0.1, 0.1);
         }
      '';
   };
}

