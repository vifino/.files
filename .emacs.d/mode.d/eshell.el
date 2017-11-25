;; eshell stuff, not really a lang, but a mode none the less.
(add-hook 'eshell-mode-hook
          (lambda ()
            (define-key eshell-mode-map (kbd "<tab>") 'completion-at-point)))

