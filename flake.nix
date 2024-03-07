{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    impermanence.url = "github:nix-community/impermanence";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-software-center.url = "github:vlinkz/nix-software-center";
#    sops-nix.url = "github:Mic92/sops-nix";
    agenix.url = "github:ryantm/agenix";
  };

  outputs = inputs@{ nixpkgs, home-manager, agenix, impermanence, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          
          
#          sops-nix.nixosModules.sops
#          ./services/gpg-agent.nix
          agenix.nixosModules.default
          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # TODO replace ryan with your own username
            home-manager.users.alternex =  { 
              home.username = "alternex";
              home.homeDirectory = "/home/alternex";
              imports = [ ./home.nix (inputs.impermanence + "/home-manager.nix") ];

             # New: Now we can use the "home.persistence" module, here's an example:
              home.persistence."/persist/home/alternex" = {
                  directories = [ 
                    ".dotfiles" 
                    ".config"
                    ".local"
                    "dev"
                    "Documents"
                    "Downloads"
                  ];
                  
                  files = [ 
                    ".bash_history" 
                    #".bashrc" 
                    #".bash_profile" 
                    ".gitconfig" 
                  ];
              };
            };
            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }

          impermanence.nixosModules.impermanence
          {

                # configure impermanence
                environment.persistence."/persist" = {
                  directories = [
                    "/etc/nixos"
                  ];
    
                  files = [
                    "/etc/machine-id"
                    "/etc/ssh/ssh_host_ed25519_key"
                    "/etc/ssh/ssh_host_ed25519_key.pub"
                    "/etc/ssh/ssh_host_rsa_key"
                    "/etc/ssh/ssh_host_rsa_key.pub"
                  ];
                };
          }
        ];
      };
    };
  };
}
