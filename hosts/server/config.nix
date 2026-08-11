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
   networking.hostName = "NixOS-Server";

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

