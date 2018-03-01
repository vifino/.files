;; C and friends.

;; irony
(req-package irony :ensure t
  :commands (irony-mode irony-cdb-autosetup-compile-options))

(req-package company-irony :ensure t
	:require company irony
	:commands company-irony)

(req-package flycheck-irony :ensure t
	:require flycheck irony
	:commands flycheck-irony-setup)

(req-package irony-eldoc :ensure t
	:require irony
	:commands irony-eldoc)

;; irony hooks
(defun vifino/c-hook ()
  (rainbow-delimiters-mode)
  (irony-cdb-autosetup-compile-options)
  (setq company-backends '(company-irony))
  (flycheck-irony-setup)
  (irony-eldoc)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace)
  (flycheck-mode)
  (set (make-local-variable 'compile-command)
       (format "make -C %s" (file-name-directory (get-closest-pathname "Makefile"))))
  (irony-mode))

(add-hook 'c++-mode-hook 'vifino/c-hook)
(add-hook 'c-mode-hook 'vifino/c-hook)
(add-hook 'objc-mode-hook 'vifino/c-hook)

(add-to-list 'auto-mode-alist '("\\.ino\\'" . c-mode))
