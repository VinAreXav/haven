{ config, lib, pkgs, ... }:

{
  imports =
    [      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
   # Enable OpenTabletDriver
  hardware.opentabletdriver.enable = true;

  # Required by OpenTabletDriver
  hardware.uinput.enable = true;
  boot.kernelModules = [ "uinput" ];

  networking.hostName = "aha";
  nixpkgs.config.allowUnfree = true;

  hardware.graphics.enable = true;     # Enable graphics
  hardware.nvidia = {
    open = false;          # Use proprietary mode
    nvidiaSettings = true; # Optional: installs nvidia-settings tool
  };

  # Optional: enable PRIME offload (important on laptops with integrated + dGPU)
  # hardware.nvidia.prime = {
  #   offload.enable = true;
  #   enableOffloadCmd = true;
  #   intelBusId = "PCI:0:2:0";   # adjust from `lspci`
  #   nvidiaBusId = "PCI:1:0:0";  # adjust from `lspci`
  # };

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Bishkek";

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  services = {
  xserver = {
  	enable = true;
	videoDrivers = [ "nvidia" ];
	};

  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";
  printing.enable = true;
  pipewire = {
     enable = true;
     pulse.enable = true;
  };
  openssh.enable = true;
  asusd.enable = true;

  libinput.enable = true;
  displayManager.sddm = {
  	enable = true;
	wayland.enable = true;
	};

};

  users.users.xavier = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
     shell = pkgs.zsh;
   };

   programs.niri.enable = true;
   programs.zsh.enable = true;
   programs.rog-control-center.enable = true;

   environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    kitty
    alacritty
    fuzzel
    qutebrowser
    zsh
    fzf-zsh
    nemo
    nsxiv
    swaybg
    wineWowPackages.waylandFull
    krita-unwrapped
    ranger
    pywal16
    zoxide
    obsidian
    anki-bin
    ankiAddons.anki-connect
    ankiAddons.review-heatmap
    eww
    fcitx5-mozc
    fcitx5
    rofi
    texlivePackages.cjkpunct
    texlivePackages.cjkutils
    p7zip
    file-roller
    xarchiver
    unzip
    zip
    gnutar
    fzf
    wl-clipboard
    fastfetch
    nwg-look
    xwayland-satellite
    psmisc
    python315
    librewolf
    kdePackages.polkit-kde-agent-1
    glib
    python314Packages.pygobject3
    pavucontrol
    winetricks
    brightnessctl
    wineWowPackages.stable
    freetube
   ];

  programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
  };

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

