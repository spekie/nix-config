{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    tmp.cleanOnBoot = true;
  };
}
