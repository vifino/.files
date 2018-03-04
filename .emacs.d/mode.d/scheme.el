;; scheme stuff

(defun my-scheme-mode-hook ()
  (rainbow-delimiters-mode)
  (setq indent-tabs-mode nil)
  (setq tab-width 2))
(add-hook 'scheme-mode-hook 'my-scheme-mode-hook)

(use-package geiser :ensure t
  :config
  (setq geiser-repl-use-other-window nil))
