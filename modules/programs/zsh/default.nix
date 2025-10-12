{
   pkgs,
   ...
}: {
   programs.zsh.enable = true;
   environment.systemPackages = [
      pkgs.zsh
   ];
}

