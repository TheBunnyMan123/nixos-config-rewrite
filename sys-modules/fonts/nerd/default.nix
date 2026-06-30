{
   pkgs,
   lib,
   ...
}: {
   fonts = {
      packages = pkgs.nerd-fonts
         |> builtins.attrValues
         |> (builtins.filter lib.attrsets.isDerivation);
   };
}

