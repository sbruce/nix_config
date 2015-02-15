# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  require =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../standard-packages.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  networking = {
    hostName = "cr48-nixos";
    wireless.enable = true;

    #firewall.allowedPorts = [ 8080 9091 ];
  };

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "lat9w-16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  time.timeZone = "America/Denver";

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.kdm.enable = true;
  services.xserver.desktopManager.kde4.enable = true;
  services.xserver.synaptics.enable = true;
  services.xserver.synaptics.palmDetect = true;
  services.xserver.synaptics.dev = "/devices/platform/i8042/serio4/input/input15";
  services.xserver.synaptics.additionalOptions =
  ''
  Option "Palm Pressure" "235.0"
  Option "Touchpad Stack Version" "1"
  Option "Integrated Touchpad" "1"
  Option "Pressure Calibration Offset" "-23.2"
  Option "Pressure Calibration Slope" "1.21"
  Option "Input Queue Delay" "0.017"
  # Bounds overrides:
  Option "Active Area Left" "1217"
  Option "Active Area Right" "5733"
  Option "Active Area Top" "1061"
  Option "Active Area Bottom" "4798"
  # Palm overrides:
  Option "Palm Pressure" "235.0"
  # SemiMT overrides:
  Option "SemiMT Correcting Filter Enable" "1"
  # Scroll Stationary Finger Distance overrides:
  Option "Scroll Stationary Finger Max Distance" "20.0"
  # Tapping Finger Min Separation Distance overrides:
  Option "Tap Min Separation" "0.0"
  # Max Pressure Change overrides:
  Option "Max Allowed Pressure Change Per Sec" "2200.0"
  Option "Max Hysteresis Pressure Per Sec" "1200.0"
  # Double Fling Buffer Depth due to 2x Interpolation
  Option "Fling Buffer Depth" "20"
  Option "Two Finger Vertical Close Distance Thresh" "35.0"
  Option "Fling Buffer Suppress Zero Length Scrolls" "0"
  '';
  #services.xserver.videoDriver = "intel";
  services.xserver.multitouch.enable = true;
  services.xserver.multitouch.ignorePalm = true;

  boot.kernelPackages = pkgs.linuxPackages_3_18;
  nixpkgs.config.packageOverrides = pkgs:
    { linux_3_18 = pkgs.linux_3_18.override {
        extraConfig =
          ''
          CHROME_PLATFORMS y
          '';
    };
  };

}
