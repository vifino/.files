;; rust!!
(use-package rust-mode :ensure t
  :mode "\\.rs\\'"
  :bind (("C-c C-f" . rust-format-buffer))
  :init
  (add-hook 'rust-mode-hook
            (lambda ()
              (flycheck-mode)
              (set (make-local-variable 'compile-command) "cargo build")
              (add-to-list 'write-file-functions 'delete-trailing-whitespace)
              (lsp))))
