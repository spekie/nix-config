{ config, pkgs, ... }:

{
  imports = [
    ./bindings.nix
    ./swaybar.nix
    ./tofi.nix
    ./mako.nix
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  programs.sway.extraPackages = with pkgs; [
    swaybg
    swayidle
    swaylock
    wmenu
    imv
    grim
    slurp
    mako
    i3blocks
    acpi
    sysstat
    tofi
  ];

  hm.wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    checkConfig = false;

    config = rec {
      defaultWorkspace = "workspace number 1";

      colors.focused = {
        border = config.color.primary;
        background = config.color.primary;
        text = config.color.foreground;
        indicator = config.color.primary;
        childBorder = config.color.primary;
      };
      colors.unfocused = {
        border = config.color.background;
        background = config.color.background;
        text = config.color.foreground;
        indicator = config.color.background;
        childBorder = config.color.background;
      };

      floating.criteria = [
        { app_id = "xdg-desktop-portal-gtk"; }
        { class = "steam"; }
      ];
    };

    config.output = {
      "*" = {
        bg = "${config.wallpaperPath} fill";
      };
    };

    config.input = {
      "type:pointer" = {
        accel_profile = "flat";
      };
      "type:keyboard" = {
        xkb_layout = "us";
        xkb_variant = "altgr-intl";
        xkb_numlock = "enabled";
      };
      "type:touchpad" = {
        tap = "enabled";
      };
    };

    extraConfig = ''
      default_border pixel 2
      default_floating_border none
    '';
  };
}
