{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nvf,  ... } @inputs: {
    # use "nixos", or your hostname as the name of the configuration
    # it's a better practice than "default" shown in the video

    packages."x86_64-linux".default =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
	modules = [ ./nvf.nix ];
      }).neovim;

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./nixos/configuration.nix
	nvf.nixosModules.default
        home-manager.nixosModules.home-manager
	{
	  home-manager = {
	    useGlobalPkgs = true;
	    useUserPackages = true;
	    users.ignis = import ./home/home.nix;
	    extraSpecialArgs = {inherit inputs;};
	  };
	}
      ];
    };
  };
}
