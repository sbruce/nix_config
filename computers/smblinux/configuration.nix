# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  require =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../standard-packages.nix
      ../../standard-services.nix
      ../../standard-nixpath.nix
      ../../syncthing.nix
      ../../users/shaun.nix
      ../../fio_schipper.nix
    ];

  services.syncthing.enable = true;

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  #boot.loader.grub.default = saved;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  boot.loader.grub.extraConfig =
  ''
     GRUB_DEFAULT=saved
  '';

  boot.loader.grub.extraEntries =
    ''
    menuentry "Windows 7" {
      chainloader (hd0,1)+1
    }
    '';

  networking.hostName = "smblinux"; # Define your hostname.

  # List services that you want to enable:

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.kdm.enable = true;
  services.xserver.desktopManager.kde4.enable = true;
  #services.xserver.desktopManager.xfce.enable = true;

  users.extraUsers.lco04153 = {
     isNormalUser = true;
     extraGroups = [ "wheel" "disk" "tty" ];
  };
}
