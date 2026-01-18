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
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
      nixpkgs-oct-11-2025.url = "github:NixOS/nixpkgs/362791944032cb532aabbeed7887a441496d5e6e";
   };

   outputs = inputs@{ flake-parts, ... }: flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
         ./hosts
      ];

      systems = [ "x86_64-linux" ];
   };
}
