# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  boot.initrd.luks.devices."luks-587636c0-7a3b-4a56-ac80-b99e575ff388".keyFile = "/crypto_keyfile.bin";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Hong_Kong";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_HK.utf8";
    LC_IDENTIFICATION = "en_HK.utf8";
    LC_MEASUREMENT = "en_HK.utf8";
    LC_MONETARY = "en_HK.utf8";
    LC_NAME = "en_HK.utf8";
    LC_NUMERIC = "en_HK.utf8";
    LC_PAPER = "en_HK.utf8";
    LC_TELEPHONE = "en_HK.utf8";
    LC_TIME = "en_HK.utf8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  
  # Enable Flatpak Support
  services.flatpak.enable = true;
  
  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.leonard = {
    isNormalUser = true;
    description = "leonard";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      kate
      thunderbird
      emacs28NativeComp
      wine-staging
      winetricks
      vlc	
      lutris
      kitty
      kitty-themes
      neovim
      noisetorch
      xclip
      mullvad-vpn
      starship
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code
    fira-code-symbols
    pkgs.winePackages.fonts
    (nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    microcodeAmd
    git
    mesa
    libpng
    giflib
    gnutls
    mpg123
    openal
    v4l-utils
    libv4l
    libpulseaudio
    alsa-lib
    alsa-plugins
    libjpeg
    xorg.libXcomposite
    xorg.libXinerama
    ocl-icd
    libxslt
    libva
    gtk4
    gtk3
    vulkan-utils
    vulkan-tools
    vulkan-loader
    vulkan-headers
    ncurses
    firewalld
    firewalld-gui
    zsh
    exa
    python
    fzf
  ];

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code
    fira-code-symbols
    pkgs.winePackages.fonts
    (nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opentabletdriver.enable = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
