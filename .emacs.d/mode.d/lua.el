;; Lua stuff.

(req-package lua-mode
  :load-path "pkg"
  :mode "\\.lua\\'"
  :init
  (autoload 'lua-mode "lua-mode" "Lua editing mode." t)
  (add-hook 'lua-mode-hook (lambda ()
                             (setq indent-tabs-mode t
                                   tab-width lua-indent-level)))
  :config
  (setq lua-indent-level 2))

(req-package company-lua :ensure t
  :require lua-mode
  :init
  (add-hook 'lua-mode-hook (lambda ()
                             (push 'company-lua (make-local-variable company-backends)))))
