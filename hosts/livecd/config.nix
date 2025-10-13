{
   pkgs,
   lib,
   config,
   ...
}: {
   networking.hostName = "NixOS-LiveCD";
   home-manager.users.bunny.home.stateVersion = config.system.stateVersion;

   nixpkgs.hostPlatform = "x86_64-linux";
   networking.networkmanager.enable = lib.mkForce false;

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
   ];
}

