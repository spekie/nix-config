{ pkgs, ... }:

{
  imports = [
    ./home.nix
    ./home-manager.nix
    ./nh.nix
    ./fonts.nix
    ./gui.nix
    ./boot.nix
    ./settings.nix
  ];

  environment.systemPackages = with pkgs; [
    file
    zip
    unzip
    wget
    tree
    git
    xdg-utils
    xdg-user-dirs
  ];
}
