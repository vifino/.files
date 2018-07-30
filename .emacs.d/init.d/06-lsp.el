;; emacs-lsp
;; pretty buggy, at the moment, unfortunately.
;; manual clone of https://github.com/emacs-lsp/lsp-mode to ~/.emacs.d/pkg/lsp-mode recommended, currently.
(req-package lsp-mode :ensure t
  :defer t
  :require flycheck
  :diminish (lsp-mode "LSP")
  :commands (lsp-mode lsp-define-stdio-client lsp-client-on-notification
            lsp-make-traverser lsp-capabilites lsp-mode-line lsp-define-tcp-client)
  :config
  (setq lsp-enable-eldoc t)
  (setq lsp-response-timeout 25))

(req-package lsp-ui :ensure t
  :require flycheck lsp-mode
  :commands lsp-ui-mode
  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(req-package company-lsp :ensure t
  :require company lsp-mode
  :commands company-lsp
  :config
  (setq company-lsp-async t)
  (setq company-lsp-enable-recompletion t)
  :init
  (add-hook 'lsp-mode-hook (lambda () (progn
                                        (require 'company-lsp)
                                        (push 'company-lsp (make-local-variable company-backends))))))
