{ config, pkgs, ... }:

{
  #home.username = "alternex";
  #home.homeDirectory = "/home/alternex";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  #xresources.properties = {
  #  "Xcursor.size" = 16;
  #  "Xft.dpi" = 172;
  # };

  # Set dconf settings
  # dconf.settings = {
  #   "org/gnome/desktop/wm/preferences" = {
  #     button-layout = "close,minimize,maximize:appmenu";
  #   };

  #   "org/gnome/desktop/interface" = {
  #     color-scheme = "prefer-dark";
  #   };
  # };

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "loki-odin-devtest";
    userEmail = "loki_odin_devtest@protonmail.com";
  };


  


  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    

    neofetch
    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq
    fzf # A command-line fuzzy finder

    # networking tools
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    broot
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    nb
    duf
    du-dust
    fd
    tldr
    stacer
    obsidian
    
    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor
    dconf2nix
    # productivity
    copyq
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
   
    # crypto
    pinentry-gnome
    gnupg
    openssh
  ];


  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
      PS1="\[\e[93m\]\u\[\e[38;5;214m\]@\[\e[38;5;32m\]\h\[\e[38;5;166m\]:\[\e[38;5;178m\]\w\[\e[0m\]\$ "
    '';
    

    # Bash History Control
    historyControl = [ "ignoredups" "ignorespace" ];   

    # set some aliases, feel free to add more or remove some
    shellAliases = {
     s = "sudo poweroff";
     eza = "eza -blah";
     bat = "bat --paging=never";
     exa = "eza -blah";
     # k = "kubectl";
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
