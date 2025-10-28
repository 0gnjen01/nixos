{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nvf, home-manager, hjem, ... } @inputs: {

    packages."x86_64-linux".default =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
	modules = [ ./modules/nvf.nix ];
      }).neovim;

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./modules/nixos/configuration.nix
	nvf.nixosModules.default
        hjem.nixosModules.default
        home-manager.nixosModules.home-manager {
	  home-manager = {
	    useGlobalPkgs = true;
	    useUserPackages = true;
	    users.ignis = import ./modules/home/home.nix;
	    extraSpecialArgs = {inherit inputs;};
            backupFileExtension = "backup";
	  };
	}
      ];
    };
  };
}
