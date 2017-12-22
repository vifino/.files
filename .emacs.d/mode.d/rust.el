;; rust!!
(use-package rust-mode :ensure t
  :mode "\\.rs\\'"
  :bind (("C-c C-f" . rust-format-buffer))
  :init
  (add-hook 'rust-mode-hook #'flycheck-mode)
  (add-hook 'rust-mode-hook
            (lambda ()
              (set (make-local-variable 'compile-command) "cargo build")
              (add-to-list 'write-file-functions 'delete-trailing-whitespace))))

(use-package racer :ensure t
  :commands racer-mode
  :init
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode))

;; sadly not ready yet. crashes often. very often.
;(use-package lsp-rust :ensure t
;  :commands lsp-rust-enable
;  :init (add-hook 'rust-mode (progn
;    (require 'lsp-mode)
;    (require 'lsp-rust))))

;(use-package flycheck-rust :ensure t
;  :commands flycheck-rust-setup
;  :init
;  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
;  (add-hook 'racer-mode-hook #'flycheck-mode))
