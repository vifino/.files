(setq lsp-keymap-prefix "C-c l")

(use-package lsp-mode :ensure t
  :hook (
         (rust-mode . lsp-deferred)
         (go-mode . lsp-deferred))
  :commands (lsp lsp-deferred)
  :config
  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t)))

(use-package lsp-ui :ensure t
  :commands lsp-ui-mode)

(use-package lsp-ivy :ensure t
  :commands lsp-ivy-workspace-symbol)
