;; Config to get a better mail writing experience.
;; For Mutt/Neomutt.

(defun mutt-mail-mode-hook ()
  (flush-lines "^\\(> \n\\)*> -- \n\\(\n?> .*\\)*") ; kill quoted sigs
  (set-buffer-modified-p nil)
  (mail-text)
  (setq make-backup-files nil)
  (turn-on-auto-fill)
  (font-lock-add-keywords nil
                          '(("^[ \t]*>[ \t]*>[ \t]*>.*$"
                             (0 'mail-multiply-quoted-text-face))
                            ("^[ \t]*>[ \t]*>.*$"
                             (0 'mail-double-quoted-text-face)))))

;; associate with both mutt and neomutt
(or (assoc "mutt-" auto-mode-alist)
    (setq auto-mode-alist (cons '("/tmp/mutt.*" . mail-mode) auto-mode-alist)))
(or (assoc "neomutt-" auto-mode-alist)
    (setq auto-mode-alist (cons '("/tmp/neomutt.*" . mail-mode) auto-mode-alist)))


(add-hook 'mail-mode-hook 'mutt-mail-mode-hook)
