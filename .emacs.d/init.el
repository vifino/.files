;;;;
;;; emacs init.d loader
;;;;

(require 'cl-lib)

(defun fload (fn)
  (message ">> loading %s" fn)
  (load fn nil t))

(defun listfiles (dn &optional ext)
  (or ext (setq ext "el"))

  (mapcar (lambda (fn)
            (if (file-exists-p (concat fn "c"))
                (concat fn "c")
              fn))
   (cl-remove-if
   (lambda (fn) (equal (substring (file-name-base fn) 0 1) "."))
   (file-expand-wildcards (concat dn "/*." ext)))))

;; simple loading of a directory.
(defun floaddir (dn)
  (message ">> loading from %s..." dn)
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
   (listfiles dn "el")))

;; Custom file
(setq custom-file "~/.emacs.d/custom.el")

;; need to initialize package
(package-initialize)

;; load our init.d directory
(sautoloaddir "~/.emacs.d/fn.d")
;; load our init.d directory
(floaddir "~/.emacs.d/init.d")
