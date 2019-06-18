;; C and friends.

;; irony
(use-package irony :ensure t
  :commands (irony-mode irony-cdb-autosetup-compile-options))

(use-package company-irony :ensure t
	:after (company irony)
	:commands company-irony)

(use-package flycheck-irony :ensure t
	:after (flycheck irony)
	:commands flycheck-irony-setup)

(use-package irony-eldoc :ensure t
	:after (irony)
	:commands irony-eldoc)

;; irony hooks
(defun vifino/c-hook ()
  (rainbow-delimiters-mode)
  (irony-cdb-autosetup-compile-options)
  (irony-mode)
  (setq company-backends '(company-irony))
  (flycheck-mode)
  (flycheck-irony-setup)
  (irony-eldoc)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace)
  (let ((makefile (or (get-closest-pathname "GNUmakefile") (get-closest-pathname "Makefile"))))
    (and makefile
         (set (make-local-variable 'compile-command)
              (format "make -C %s" (file-name-directory makefile))))))

(add-hook 'c++-mode-hook 'vifino/c-hook)
(add-hook 'c-mode-hook 'vifino/c-hook)
(add-hook 'objc-mode-hook 'vifino/c-hook)

(add-to-list 'auto-mode-alist '("\\.ino\\'" . c-mode))
