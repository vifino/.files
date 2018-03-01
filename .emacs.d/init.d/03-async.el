;; emacs-async for some speedups, maybe.
(req-package async :ensure t
  :commands (async-start-process async-get async-ready
             async-wait async-inject-variables async-let)
  :init
  (dired-async-mode 1)
  (async-bytecomp-package-mode 1)
  :config
  (setq async-bytecomp-allowed-packages '(all)))
