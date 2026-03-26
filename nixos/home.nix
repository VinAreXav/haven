{ config, pkgs, ... }:

{
	home.username  = "xavier";
	home.homeDirectory = "/home/xavier";
	home.stateVersion = "25.11";
	gtk = {
			enable = true;
			cursorTheme.package = pkgs.bibata-cursors;
			cursorTheme.name = "Bibata-Modern-Ice";
			theme.package = pkgs.kanagawa-gtk-theme;
			theme.name = "kanagawa";
			iconTheme.package = pkgs.numix-icon-theme;
			iconTheme.name = "Numix";
	};

	qt = {
			enable = true;
			platformTheme.name = "gtk";
			style.name = "adwaita-light";
			style.package = pkgs.adwaita-qt;
	};
	programs.obsidian = {
			enable = true;
	};
	programs.git = {
    		enable = true;
    		settings = {
      			user = {
        		name  = "VinAreXav";
        		email = "ruiruikurushi@gmail.com";
			credential.helper = "${
          			pkgs.git.override { withLibsecret = true; }
        			}/bin/git-credential-libsecret";
      			};
      		init.defaultBranch = "main";
    		};
  	};

	programs.zsh = {
		enable = true;
		enableCompletion = true;
    	autosuggestion.enable = true;
		
		shellAliases = {	
				la = "ls -a";
				rebuild = "sudo nixos-rebuild switch --flake '/home/xavier/Desktop/meow/nixos#aha'";
				store= "sudo nix-store --check-contents --verify --repair";
				garbage = "nix-collect-garbage -d";
				old = "sudo nix-collect-garbage  --delete-old";
				update = "sudo nixos-rebuild switch --upgrade --flake '/home/xavier/Desktop/meow/nixos#aha'";
				nos = "nvim ~/Desktop/meow/nixos";
				neow = "nvim ~/Desktop/meow";
				note = "notesmd-cli";

		};
    			oh-my-zsh = {
    			enable = true;
    			theme = "robbyrussell";
    			plugins = [
      				"git"
				"zsh-interactive-cd"
    			];
		};
		 plugins = [
      			{   name = "zsh-autosuggestions";
        			src = pkgs.zsh-autosuggestions;
      			}
      			{   name = "zsh-syntax-highlighting";
        			src = pkgs.zsh-syntax-highlighting;
      			}
				{   name = "zsh-completions";
				    src = pkgs.zsh-completions;
				}
				{	name = "fast-syntax-highlighting";
				    src = pkgs.zsh-fast-syntax-highlighting;
				}
				{	name = "zsh-autocomplete";
				    src = pkgs.zsh-autocomplete;
				}
				{	name = "zsh-fzf-tab";
				    src = pkgs.zsh-fzf-tab;
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
		# Environment variables
    		envExtra = ''
      		export LANG="en_US.UTF-8"
      		export EDITOR="nvim"
		autoload -U compinit && compinit
		ZSH_INTERACTIVE_CD_PREVIEW=true
		source ~/.zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
    		'';
	};

	programs.zoxide = {
  		enable = true;
  		enableZshIntegration = true;
  		options = [ "--cmd cd" ];
	};
	
}
