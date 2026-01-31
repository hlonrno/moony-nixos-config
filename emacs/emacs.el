(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; Theme
(load-theme 'catppuccin :no-confirm)
(setq catppuccin-flavor 'macchiato)
(catppuccin-reload)

;;; Modes

;; Company yas
(add-hook 'after-init-hook 'global-company-mode)

;; Simple C mode (https://github.com/rexim/simpc-mode)
(add-to-list 'load-path "/home/moony/.config/home-manager/emacs/simpc-mode.el")
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))
