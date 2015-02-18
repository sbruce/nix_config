{config, pkgs, ...}:
with pkgs.lib;
{
  config =
  {
    nixpkgs.config.allowUnfree = true;

    nixpkgs.config.firefox = {
      enableGoogleTalkPlugin = true;
      enableAdobeFlash = true;
    };

    environment.systemPackages =
    [
      pkgs.stdenv
      pkgs.firefoxWrapper
      pkgs.git
      pkgs.vim
      pkgs.atom
      pkgs.python
      pkgs.mono
      pkgs.wineUnstable
    ];
  };
}
