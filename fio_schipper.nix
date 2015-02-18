{config, pkgs, ...}:
with pkgs.lib;
{

  nixpkgs.config.packageOverrides = in_pkgs : rec
  {


    fio_schipper = pkgs.buildPythonPackage {
      name = "fio_schipper-20150106b";

      src = pkgs.fetchgit {
        url = "http://10.30.95.2/sbruce/fio_schipper.git";
        rev = "refs/heads/master";
        sha256 = "1h2gf2snnx8wc2zmyp1yvalql6v6yjgy82k7ln44lb9kppmbd016";

      };

      buildInputs = [ "pkgs.pythonPackages.setuptools" "pkgs.pythonPackages.pyserial"];

      propagatedBuildInputs = [ pkgs.pythonPackages.pyserial ];

    };

  };

  environment.systemPackages = with pkgs; [
    smartmontools
    sdparm
    hdparm
    fio_schipper
    (lib.overrideDerivation pkgs.fio (attrs: {
      name = "fio-1.57";
      src = fetchgit {
        url = git://git.kernel.dk/fio.git;
        rev = "173dbaa47e3a477db65aa9fb1932a33d87436994";
        sha256 = "1ihxn688bm3vbdy24w7fzhjfnzfkf1ylxs87fq7sc9wr5cy8nyab";
      };


    }))
  ];
}
