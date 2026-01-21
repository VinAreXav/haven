{ config, pkgs, ... }:

{
	home.username  = "xavier";
	home.homeDirectory = "/home/xavier";
	home.stateVersion = "25.11";
	programs.zsh = {
		enable = true;
		shellAliases = {	
		la = "ls -a";
		rebuild = "sudo nixos-rebuild switch --flake '/etc/nixos#aha'";
		store= "sudo nix-store --check-contents --verify --repair";
		garbage = "nix-collect-garbage -d";
		entries = "sudo nix-env --delete-generations old";
		};

		initExtraFirst = ''
      			export PATH="$HOME/bin:/usr/bin:/usr/local/bin:$HOME/.local/bin:$PATH"
    		'';
    		# Environment variables
    		envExtra = ''
      		export LANG="en_US.UTF-8"
      		export EDITOR="nvim"
    		'';
		oh-my-zsh = {
    			enable = true;
    			theme = "robbyrussell";
    			plugins = [
      				"git"
    			];
		};
		 plugins = [
      			{
        			name = "zsh-autosuggestions";
        			src = pkgs.zsh-autosuggestions;
      			}
      			{
        			name = "zsh-syntax-highlighting";
        			src = pkgs.zsh-syntax-highlighting;
      			}
			{       name = "zsh-completions";
				src = pkgs.zsh-completions;
			}

			{	name = "fast-syntax-highlighting";
				src = pkgs.zsh-fast-syntax-highlighting;
			}
			{	name = "zsh-autocomplete";
				src = pkgs.zsh-autocomplete;
			}

    		];
		setOptions = [
  			"append_history"
  			"inc_append_history"
  			"share_history"
  			"auto_menu"
  			"menu_complete"
  			"autocd"
  			"no_case_glob"
  			"no_case_match"
  			"dot_glob"
  			"extended_glob"
		];
	};

	programs.zoxide = {
  		enable = true;
  		enableZshIntegration = true;
  		options = [ "--cmd cd" ];
	};
}
