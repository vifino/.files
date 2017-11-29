;;;;
;;; emacs init.d loader
;;;;

(eval-when-compile
  (progn
    (require 'cl-lib)

    (defun fload (fn)
      (message ">> loading %s" fn)
      (load fn nil t))

    (defun listfiles (dn &optional ext)
      (or ext (setq ext "el"))
      (cl-remove-if
       (lambda (fn) (equal (substring (file-name-base fn) 0 1) "."))
       (file-expand-wildcards (concat dn "/*." ext))))

    ;; simple loading of a directory.
    (defun floaddir (dn)
      (message ">> loading %s/*.el..." dn)
      (mapc (lambda (fn)
              (message "  >> loading %s" fn)
              (load fn nil t))
	    (listfiles dn "el")))

    ;; simple autoload generation based on file name.
    (defun sautoloaddir (dn)
      (message ">> generating autoloads for %s.." dn)
      (mapc
       (lambda (file)
         (let ((fn (file-name-base file)))
           (message "  >> autoload %s from %s" fn file)
           (autoload (intern fn) file (format "<autoload from %s>" file) t)))
       (listfiles dn)))

    ;; init Package.el
    (package-initialize)

    ;; Custom file
    (setq custom-file "~/.emacs.d/custom.el")))

(eval-and-compile
  ;; load our init.d directory
  (sautoloaddir "~/.emacs.d/fn.d")
  ;; load our init.d directory
  (floaddir "~/.emacs.d/init.d"))
