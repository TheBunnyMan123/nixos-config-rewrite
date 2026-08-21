{
   inputs,
   pkgs,
   ...
}: {
   imports = [
      inputs.hardware.nixosModules.framework-13-7040-amd
   ];

   swapDevices = [
	{device = "/swapfile"; size=16384;}
   ];

   system.stateVersion = "23.05";
   networking.hostName = "NixOS-Laptop";

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

      brightnessctl
   ];
}

