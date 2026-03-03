{
  description = "DevOps Home Manager под root";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    krewfile = {
      url = "github:brumhard/krewfile";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, krewfile, ... }@inputs:
  let
    system = "x86_64-linux";   # ← поменяй, если у тебя aarch64-linux (ARM), x86_64-darwin (Intel Mac) или aarch64-darwin (Apple Silicon)
  in {
    homeConfigurations.root = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};   # ← вот так правильно

      extraSpecialArgs = { inherit inputs; };

      modules = [
        ./home.nix
        { home.stateVersion = "25.05"; }
      ];
    };
  };
}
