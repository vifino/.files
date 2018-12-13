;; rust!!
(use-package rust-mode :ensure t
  :mode "\\.rs\\'"
  :bind (("C-c C-f" . rust-format-buffer))
  :init
  (add-hook 'rust-mode-hook
            (lambda ()
              (flycheck-mode)
              (set (make-local-variable 'compile-command) "cargo build")
              (add-to-list 'write-file-functions 'delete-trailing-whitespace))))

;(req-package racer :ensure t
;  :commands racer-mode company
;  :init
;  (add-hook 'rust-mode-hook #'racer-mode)
;  (add-hook 'racer-mode-hook #'eldoc-mode)
;  (add-hook 'racer-mode-hook #'company-mode))

;; sadly crashes often. very often.
(use-package lsp-rust :ensure t
  :after (lsp-mode rust-mode)
  :commands lsp-rust-enable
  :init
  (add-hook 'rust-mode-hook (lambda ()
                              (eval-after-load 'lsp-mode
                                     (lsp-rust-enable)))))

;(req-package flycheck-rust :ensure t
;  :require flycheck racer
;  :commands flycheck-rust-setup
;  :init
;  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
;  (add-hook 'racer-mode-hook #'flycheck-mode))
