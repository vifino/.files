;; emacs-lsp
;; pretty buggy, at the moment, unfortunately.
;; manual clone of https://github.com/emacs-lsp/lsp-mode to ~/.emacs.d/pkg/lsp-mode recommended, currently.
(use-package lsp-mode
  :defer t
  :diminish (lsp-mode "LSP")
  :commands (lsp-mode lsp-define-stdio-client lsp-client-on-notification
            lsp-make-traverser)
  :config
  (setq lsp-enable-eldoc t)
  (with-eval-after-load 'lsp-mode
    (require 'lsp-flycheck)))
