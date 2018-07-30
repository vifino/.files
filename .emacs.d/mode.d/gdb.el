;; GDB-MI stuff.

;; Reset prompt to non-color basic prompt.
(setq gud-gdb-command-name "gdb-mi")

;; Force gdb-mi to not dedicate any windows.
(advice-add 'gdb-display-buffer
            :around (lambda (orig-fun &rest r)
                      (let ((window (apply orig-fun r)))
                        (set-window-dedicated-p window nil)
                        window)))

(advice-add 'gdb-set-window-buffer
            :around (lambda (orig-fun name &optional ignore-dedicated window)
                      (funcall orig-fun name ignore-dedicated window)
                      (set-window-dedicated-p window nil)))
