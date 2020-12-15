;; Go support
;; needs clone of https://github.com/emacs-lsp/lsp-go to ~/.emacs.d/pkg/lsp-go for lsp-go

(use-package go-mode :ensure t
  :mode "\\.go\\'"
  :config
  (add-hook 'go-mode-hook (lambda ()
                            (set (make-local-variable 'compile-command) "go build")
                            (add-hook 'before-save-hook #'lsp-format-buffer t t)
                            (add-hook 'before-save-hook #'lsp-organize-imports t t)
                            (flycheck-mode))))

(use-package company-go :ensure t
  :after (company)
  :config
  (add-hook 'go-mode-hook 'company-mode)
  (add-to-list 'company-backends 'company-go))
