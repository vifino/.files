;; (e)lisp settings.

;; elisp mode
(defun vifino/elisp-hook ()
  (add-to-list 'write-file-functions 'delete-trailing-whitespace)
  (eldoc-mode)
  (flycheck-mode)
  (set (make-local-variable 'flycheck-checkers) '(emacs-lisp))
  (set (make-local-variable 'indent-tabs-mode) nil)
  (add-hook 'after-save-hook ; byte-compile .el on save if it's .elc exists.
            (lambda ()
              (let ((fn (buffer-file-name)))
                (when (and fn (string-match-p ".*\\.el\\'" fn)
                           (file-exists-p (byte-compile-dest-file fn)))
                  (emacs-lisp-byte-compile))))
            nil t))

(add-hook 'emacs-lisp-mode-hook 'vifino/elisp-hook)

;; ielm
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(defun vifino/ielm-hook ()
  (eldoc-mode)
  (ivy-mode +1))

(add-hook 'ielm-mode-hook 'vifino/ielm-hook)
