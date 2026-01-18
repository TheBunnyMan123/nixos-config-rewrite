{
   pkgs,
   pkgsOct2025,
   ...
}: {
   programs.tmux = {
      enable = true;
      keyMode = "vi";
      mouse = true;
      prefix = "C-Space";
      secureSocket = true;
      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "tmux-256color";
      extraConfig = ''
         set -sg terminal-overrides ",*:RGB,*:Tc,tmux-256color:RGB,tmux-256color:Tc"
         source ${./theme.conf}
      '';
   };
}

