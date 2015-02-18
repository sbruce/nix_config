{config, pkgs, ...}:
with pkgs.lib;
{

  users.extraUsers = {
    shaun =
    {
      createHome = false;
      isNormalUser = true;
      home = "/home/shaun";
      openssh.authorizedKeys.keyFiles = [./ssh/shaun.pub];
      uid = 1000;
      extraGroups = [ "wheel" ];
    };
  };
}
