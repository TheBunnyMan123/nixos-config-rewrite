{
   inputs,
   pkgs,
   ...
}: {
   imports = [
      inputs.hardware.nixosModules.framework-13-7040-amd
   ];

   system.stateVersion = "23.05";
   networking.hostName = "NixOS-Laptop";
   home-manager.users.bunny.home.stateVersion = "23.05";
   home-manager.users.bunny.wayland.windowManager.hyprland.settings.monitor = [
      "eDP-1,2256x1504@60.00Hz,0x0,1.33333"
   ];

   environment.systemPackages = with pkgs; [
      (jdk23.override {enableJavaFX = true;})

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
   ];
}

