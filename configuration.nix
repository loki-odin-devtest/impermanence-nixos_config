# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [  
      ./hardware-configuration.nix
    ];
    

 # filesystems
  fileSystems."/".options = ["compress=zstd" "noatime" ];
  fileSystems."/home".options = ["compress=zstd" "noatime" ];
  fileSystems."/nix".options = ["compress=zstd" "noatime" ];
  fileSystems."/persist".options = ["compress=zstd" "noatime" ];
  fileSystems."/persist".neededForBoot = true;

  fileSystems."/var/log".options = ["compress=zstd" "noatime" ];
  fileSystems."/var/log".neededForBoot = true;



  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;



    boot.initrd = {
    enable = true;
    supportedFilesystems = [ "btrfs" ];

    systemd.services.restore-root = {
      description = "Rollback btrfs rootfs";
      wantedBy = [ "initrd.target" ];
      requires = [
        "dev-sda3"
      ];
      after = [
        "dev-sda3"
        # for luks
       # "systemd-cryptsetup@${config.networking.hostName}.service"
      ];
      before = [ "sysroot.mount" ];
      unitConfig.DefaultDependencies = "no";
      serviceConfig.Type = "oneshot";
      script = ''
        mkdir -p /mnt

        # We first mount the btrfs root to /mnt
        # so we can manipulate btrfs subvolumes.
        mount -o subvol=/ /dev/sda3 /mnt

        # While we're tempted to just delete /root and create
        # a new snapshot from /root-blank, /root is already
        # populated at this point with a number of subvolumes,
        # which makes `btrfs subvolume delete` fail.
        # So, we remove them first.
        #
        # /root contains subvolumes:
        # - /root/var/lib/portables
        # - /root/var/lib/machines
        #
        # I suspect these are related to systemd-nspawn, but
        # since I don't use it I'm not 100% sure.
        # Anyhow, deleting these subvolumes hasn't resulted
        # in any issues so far, except for fairly
        # benign-looking errors from systemd-tmpfiles.
        btrfs subvolume list -o /mnt/root |
        cut -f9 -d' ' |
        while read subvolume; do
          echo "deleting /$subvolume subvolume..."
          btrfs subvolume delete "/mnt/$subvolume"
        done &&
        echo "deleting /root subvolume..." &&
        btrfs subvolume delete /mnt/root

        echo "restoring blank /root subvolume..."
        btrfs subvolume snapshot /mnt/root-blank /mnt/root

        # Once we're done rolling back to a blank snapshot,
        # we can unmount /mnt and continue on the boot process.
        umount /mnt
      '';
    };
  };




  security.sudo.extraConfig = ''
    # rollback results in sudo lectures after each reboot
    Defaults lecture = never
  '';


  networking.hostName = "nixos"; # Define your hostname.

  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/Chicago";



  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  users.mutableUsers = false;
  users.users.alternex = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];


 openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJllH+5TTNeADaVOKciuFKJYSud5g70SJVXpVmT80CnM nixos" ];

 # passwordFile needs to be in a volume marked with `neededForBoot = true`
 hashedPasswordFile = "/persist/passwords/user";
};

 security.sudo.wheelNeedsPassword = false;

   # Allow unfree packages
   nixpkgs.config.allowUnfree = true;





 
   environment.systemPackages = with pkgs; [
     wget
     nano
     rsync
     git
     gh
     ncdu
     nnn
     mc
     eza
     bat
     gnome.gnome-tweaks
     gnome.gnome-terminal
     gnome-extension-manager
     gnomeExtensions.dash-to-dock
     gnomeExtensions.appindicator
     gnome.gnome-settings-daemon
     gnome.dconf-editor
     gtk-engine-murrine
     numix-icon-theme
     zerofree
     vscode
     vscode-extensions.mkhl.direnv
     nix-du
     graphviz
     openssh
     pinentry

   ];


  #   programs.bash = {
  #   # PS1 Customization
  #   promptInit = ''

  #   PS1="\[\e[93m\]\u\[\e[38;5;214m\]@\[\e[38;5;32m\]\h\[\e[38;5;166m\]:\[\e[38;5;178m\]\w\[\e[0m\]\$ "

  #   '';
  # };



  services.openssh = {
   enable = true;
   allowSFTP = false; # Don't set this if you need sftp
   settings.PasswordAuthentication = false;
   settings.KbdInteractiveAuthentication = false;
   extraConfig = ''
     AllowTcpForwarding yes
     X11Forwarding no
     AllowAgentForwarding no
     AllowStreamLocalForwarding no
     AuthenticationMethods publickey
   '';
  };


  #system.copySystemConfiguration = true;

  system.stateVersion = "23.11"; 

}

