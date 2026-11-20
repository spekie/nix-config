{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.wireguard-tools ];
  networking.wg-quick.interfaces.wg0.configFile = "${config.flakePath}/hosts/${config.hostname}/wg0.conf";
}
