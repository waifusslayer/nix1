{
  description = "Home Manager";

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
    usernameRaw = builtins.getEnv "USER";
    username = if usernameRaw != "" then usernameRaw else builtins.baseNameOf (builtins.getEnv "HOME");
    system = builtins.currentSystem or "x86_64-linux";
  in {
    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};

      extraSpecialArgs = { inherit inputs; };

      modules = [
        ./home.nix
        { home.stateVersion = "25.05"; }
      ];
    };
  };
}
