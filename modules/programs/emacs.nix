{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    emacs
  ];

  hm.services.emacs = {
    enable = true;
    defaultEditor = true;

    client = {
      enable = true;
      arguments = [
        "-c"
        "-a"
        "emacs"
      ];
    };
  };

  hm.programs.emacs = {
    enable = true;
    extraConfig = ''
      (menu-bar-mode 0)
      (tool-bar-mode 0)
      (scroll-bar-mode 0)
      (global-display-line-numbers-mode)
      (setq make-backup-files nil)
      (setq auto-save-default nil)
      (package-install 'ample-theme)
      (package-install 'multiple-cursors)
      (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
      (global-set-key (kbd "C->") 'mc/mark-next-like-this)
      (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
      (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
      (load-theme 'ample t)
    '';
  };
}
