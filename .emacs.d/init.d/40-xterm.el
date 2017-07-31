;; xterm stuff
(unless window-system
  (require 'xterm-frobs)
  (add-hook 'post-command-hook
            (lambda ()
            (xterm-set-window-title (buffer-name))))
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t))
