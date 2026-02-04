(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(setq make-backup-files nil ; file~
      auto-save-default nil ; #file#
      create-lockfiles nil) ; .#file
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'visual)

;; Theme
(load-theme 'catppuccin :no-confirm)
(setq catppuccin-flavor 'macchiato)
(catppuccin-reload)

;;; Modes

;; Company
(add-hook 'after-init-hook 'global-company-mode)

;; ;; Simple C (https://github.com/rexim/simpc-mode)
;; (add-to-list 'load-path "/home/moony/.config/home-manager/emacs/simpc-mode.el")
;; (require 'simpc-mode)
;; (add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))
