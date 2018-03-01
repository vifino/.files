;; Go support
;; needs clone of https://github.com/emacs-lsp/lsp-go to ~/.emacs.d/pkg/lsp-go for lsp-go

(req-package go-mode :ensure t
  :mode "\\.go\\'"
  :config
  (add-hook 'go-mode-hook 'flycheck-mode))

(req-package company-go :ensure t
  :require company
  :config
  (add-hook 'go-mode-hook 'company-mode)
  (add-to-list 'company-backends 'company-go))

;; also errors out. q_q
;(req-package lsp-go
;  :require lsp-mode
;  :commands (lsp-go-enable)
;  :config
;  (add-hook 'go-mode-hook 'lsp-golang-enable))
