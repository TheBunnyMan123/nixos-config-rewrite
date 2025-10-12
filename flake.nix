{
   description = "Description for the project";

   inputs = {
      catppuccin = {
         url = "github:catppuccin/nix";
         inputs = {
            nixpkgs.follows = "nixpkgs";
         };
      };

      home-manager = {
         url = "github:nix-community/home-manager";
         inputs = {
            nixpkgs.follows = "nixpkgs";
         };
      };
      
      flake-parts.url = "github:hercules-ci/flake-parts";
      hardware.url = "github:nixos/nixos-hardware";
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
   };

   outputs = inputs@{ flake-parts, ... }: flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
         ./hosts
      ];

      systems = [ "x86_64-linux" ];
   };
}
