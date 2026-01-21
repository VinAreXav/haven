{
	description = "Flake but I am trying my best";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		aagl = {
			url = "github:ezKEa/aagl-gtk-on-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

	};
	outputs = { nixpkgs, home-manager, aagl, ... }:{
		nixosConfigurations.aha = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager 
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.xavier = import ./home.nix;
						backupFileExtension = "backup";

					};
				}
				{
          				imports = [ aagl.nixosModules.default ];
          				nix.settings = aagl.nixConfig;
					programs.anime-game-launcher.enable = true;
					programs.honkers-railway-launcher.enable = true;
          				programs.sleepy-launcher.enable = true;
        			}
			];

		};


	};
}
