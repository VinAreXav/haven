{ config, lib, pkgs, ... }:

{
  imports =
    [      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware = {
  	opentabletdriver.enable = true;
	uinput.enable = true;	
	graphics.enable = true;    
  	nvidia = {
    		open = false;         
    		nvidiaSettings = true;
    	};

  };
  boot.kernelModules = [ "uinput" ];

  networking.hostName = "aha";
  nixpkgs.config.allowUnfree = true;

  # Optional: enable PRIME offload (important on laptops with integrated + dGPU)
  # hardware.nvidia.prime = {
  #   offload.enable = true;
  #   enableOffloadCmd = true;
  #   intelBusId = "PCI:0:2:0";   # adjust from `lspci`
  #   nvidiaBusId = "PCI:1:0:0";  # adjust from `lspci`
  # };

  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Astana";

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  services = {
  	xserver = {
  		enable = true;
		videoDrivers = [ "nvidia" ];
	};
  	pipewire = {
     		enable = true;
     		pulse.enable = true;
  	};
  	displayManager.sddm = {
		theme = "sddm-astronaut-theme";
		extraPackages = [ pkgs.sddm-astronaut ];
  		enable = true;
		wayland.enable = true;
	};
  libinput.enable = true;
  upower.enable = true;
  printing.enable = true;
  openssh.enable = true;
  asusd.enable = true;
  flatpak.enable = true;

};

i18n.inputMethod = {
    # Available since NixOS 24.11
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      ignoreUserConfig = true;  
	  addons = with pkgs; [
        fcitx5-mozc       
	  ];
      settings = {
        inputMethod = {
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "keyboard-us";
          };
          "Groups/0/Items/0".Name = "keyboard-us";
          "Groups/0/Items/2".Name = "mozc";
        };
      };
    };
  };
  
users.users.xavier = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     packages = with pkgs; [
       tree
     ];
     shell = pkgs.zsh;
   };

   programs = {
      	gnupg.agent = {
     		enable = true;
     		enableSSHSupport = true;
  	};
   niri.enable = true;
   hyprland = {
		   enable = true;
		   withUWSM = true;
   };
   zsh.enable = true;
   rog-control-center.enable = true;
   steam.enable = true;
   mtr.enable = true;

};

   environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    kitty
    rofi
    eww
    fzf
    (nemo-with-extensions.override {
      extensions = with pkgs; [ nemo-seahorse nemo-preview nemo-fileroller nemo-emblems folder-color-switcher ]; })
	nsxiv
	nwg-look
	bc
    swaybg
    krita-unwrapped
    pywal16
	pywalfox-native
    anki-bin
    ankiAddons.anki-connect
    ankiAddons.review-heatmap
    fcitx5-mozc
    fcitx5
    file-roller
    xarchiver
    p7zip
    unzip
    zip
    gnutar
    wl-clipboard
    fastfetch
    xwayland-satellite
    psmisc
    python315
    kdePackages.polkit-kde-agent-1
    glib
    pavucontrol
    wineWow64Packages.waylandFull
    bottles
    winetricks
    brightnessctl
    ayugram-desktop
    file
    freetube
	dex
    heroic
    protonplus
    swww
    folder-color-switcher
    gcc
    fzf
    scriptisto
    lazygit
    cargo
    clippy
    peaclock
    sunsetr
    kanagawa-gtk-theme
    gruvbox-gtk-theme
    protontricks
    ripgrep
    zathura
    qutebrowser
    lua5_4_compat
    dwt1-shell-color-scripts
    htop
	obs-studio
#texlivePackages.cjk
	pureref
	hyprland-protocols
	hyprpaper
	hyprsunset
	hyprpolkitagent
	dex
	basalt
	nnn
	hyprshot
	sddm-astronaut
	jq
	chameleos
];

   fonts.packages = with pkgs; [
    hachimarupop
    udev-gothic-nf
	nerd-fonts.jetbrains-mono
    ];

    environment.localBinInPath = true;

    security.sudo = {
        # place top level options (like wheelNeedPassword) here
        enable = true;
		execWheelOnly = false;
        wheelNeedsPassword = false;

        extraConfig = "#includedir /etc/sudoers.d";
        extraRules = [
		{
      		users = [ "xavier" ];
		runAs = "ALL";
      		commands = [
        		{
          		command = "/home/xavier/.local/bin/update-background";
          		options = [ "NOPASSWD" ];
        		}
			{
          		command = "/home/xavier/Desktop/haven/pywal16";
          		options = [ "NOPASSWD" ];
        		}
			{
          		command = "/home/xavier/Desktop/haven/walmenu.sh";
          		options = [ "NOPASSWD" ];
        		}
			{
          		command = "/home/xavier/Desktop/meow/colors/update-background";
          		options = [ "NOPASSWD" ];
        		}
			{
          		command = "/home/xavier/.config/nsxiv/exec/key-handler";
          		options = [ "NOPASSWD" ];
        		}

      		];
		}
	 ];
  };

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;
  nix.settings.experimental-features = ["nix-command" "flakes" ];
  system.stateVersion = "25.11";
}

