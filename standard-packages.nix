{config, pkgs, ...}:
with pkgs.lib;
{
  config =
  {
    nixpkgs.config.chromium =
    {
      enablePepperFlash = true;
      enablePepperPDF = true;
    };

    nixpkgs.config.allowUnfree = true;



  environment.systemPackages =
  [
    #pkgs.stdenv
    pkgs.chromium
    pkgs.firefox
    pkgs.git
    pkgs.vim
    pkgs.python
    pkgs.wineUnstable
  ];
  };
}
