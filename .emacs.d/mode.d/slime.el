(use-package slime :ensure t
  :commands (slime)
  :config
  (progn
    (add-hook
     'slime-load-hook
     #'(lambda ()
	       (slime-setup
	        '(slime-fancy
	          slime-repl
	          slime-fuzzy))))
    (setq slime-net-coding-system 'utf-8-unix)))

(use-package slime-company :ensure t
  :after (company)
  :init
  (add-hook 'slime-load-hook
            '(lambda ()
               (add-to-list 'company-backends 'company-slime))))
