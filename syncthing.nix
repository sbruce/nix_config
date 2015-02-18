{config, pkgs, ...}:
with pkgs.lib;
{
  imports = [
    users/shaun.nix
  ];


  config.environment.systemPackages = [
  (pkgs.lib.overrideDerivation pkgs.syncthing (attrs: {
     version = "0.10.23";
     name = "syncthing-0.10.23";
     src = pkgs.fetchgit {
    url = "git://github.com/syncthing/syncthing.git";
    rev = "refs/tags/v0.10.23";
    sha256 = "0zkrirkfzlh0iwqasm0k8z18hbb8zcx6vn6b5vb3bcpiwpcq66hz";
  };

  }))
  ];

  
  config.services =
  {
    syncthing = {
        enable = true;
        user = "shaun";
    };
  };
}
