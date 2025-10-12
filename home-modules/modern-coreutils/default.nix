{
   pkgs,
   ...
}: {
   home.packages = with pkgs; [
      fzf
      w3m
      yazi
      zoxide
      eza
      bat
      btop
      espeak-ng
      tmux
   ];

   programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [
         "--cmd cd"
      ];
   };
}

