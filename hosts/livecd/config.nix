{
   pkgs,
   lib,
   config,
   home-modules,
   ...
}: {
   networking.hostName = "NixOS-LiveCD";
   fonts.fontconfig.enable = lib.mkForce true;
   home-manager.useGlobalPkgs = true;
   home-manager.users.bunny.home.stateVersion = config.system.stateVersion;
   home-manager.users.bunny = {
      imports = [
         "${home-modules}/gui/hyprland"
         "${home-modules}/gui/chromium"
         "${home-modules}/gui/kitty"
         "${home-modules}/gui/vencord"
      ];
   };

   nixpkgs.hostPlatform = "x86_64-linux";
   networking.networkmanager.enable = lib.mkForce false;

   services.getty.autologinUser = lib.mkForce "bunny";

   environment.systemPackages = with pkgs; [
      coreutils-full
      git
      fastfetch
      github-cli
      neovim
      fzf
      eza
      rcs
      bat
      w3m
      rofi
      waybar
      swaynotificationcenter
      grim
      slurp
      wl-clipboard
      hypridle
      hyprpaper
      grimblast
      nautilus
   ];
}

