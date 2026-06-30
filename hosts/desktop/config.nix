{
   inputs,
   pkgs,
   ...
}: {
   imports = [
      inputs.hardware.nixosModules.common-cpu-amd
      inputs.hardware.nixosModules.common-gpu-amd
      inputs.hardware.nixosModules.common-pc-ssd
   ];

   system.stateVersion = "25.05";
   networking.hostName = "NixOS-Desktop";
   home-manager.users.solina.home.stateVersion = "25.05";
   home-manager.users.solina.wayland.windowManager.hyprland.settings.monitor = [
      "DP-1,1920x1080@143.86Hz,0x0,1"
   ];

   home-manager.users.solina.xdg.configFile."niri/display.kdl".source = ./niri-display.kdl;

   environment.systemPackages = with pkgs; [
      (jdk21.override {enableJavaFX = true;})

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

