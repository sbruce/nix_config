{config, pkgs, ...}:
with pkgs.lib;
{
  imports = [
    users/shaun.nix
  ];
  
  config.services =
  {
    syncthing = {
        enable = true;
        user = "shaun";
    };
  };
}
