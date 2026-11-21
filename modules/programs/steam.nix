{ pkgs, ... }:

{
  programs.steam.enable = true;
  hardware.graphics.enable32Bit = true;

  programs.steam.extraCompatPackages = with pkgs; [
    proton-ge-bin
    dwproton-bin
  ];
}
