;; C and friends.

;; irony
(use-package irony :ensure t
  :commands (irony-mode irony-cdb-autosetup-compile-options))

(use-package company-irony :ensure t
	:commands company-irony)

(use-package flycheck-irony :ensure t
	:commands flycheck-irony-setup)

(use-package irony-eldoc :ensure t
	:commands irony-eldoc)

;; irony hooks
(defun vifino/c-hook ()
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (setq company-backends '(company-irony))
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
  (add-hook 'irony-mode-hook #'irony-eldoc)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace)
  (flycheck-mode)
  (set (make-local-variable 'compile-command)
       (format "make -C %s" (file-name-directory (get-closest-pathname "Makefile"))))
  (irony-mode))

(add-hook 'c++-mode-hook 'vifino/c-hook)
(add-hook 'c-mode-hook 'vifino/c-hook)
(add-hook 'objc-mode-hook 'vifino/c-hook)

(add-to-list 'auto-mode-alist '("\\.ino\\'" . c-mode))
