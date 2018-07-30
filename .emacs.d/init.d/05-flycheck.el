;; flycheck
(req-package flycheck :ensure t
  :defer 2
  :commands (flycheck-mode global-flycheck-mode)
  :init (global-flycheck-mode)
  :config
  (setq flycheck-display-errors-delay 0.3))
