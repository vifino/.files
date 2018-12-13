;; Go support
;; needs clone of https://github.com/emacs-lsp/lsp-go to ~/.emacs.d/pkg/lsp-go for lsp-go

(use-package go-mode :ensure t
  :mode "\\.go\\'"
  :config
  (add-hook 'go-mode-hook 'flycheck-mode))

(use-package company-go :ensure t
  :after (company)
  :config
  (add-hook 'go-mode-hook 'company-mode)
  (add-to-list 'company-backends 'company-go))

;; also errors out. q_q
(use-package lsp-go
  :after (lsp-mode)
  :commands (lsp-go-enable)
  :config
  (add-hook 'go-mode-hook 'lsp-golang-enable))
