;; smart mode line
(req-package smart-mode-line :ensure t
  :config
  (setq sml/theme 'dark)
  (setq sml/no-confirm-load-theme t)
  (sml/setup))
