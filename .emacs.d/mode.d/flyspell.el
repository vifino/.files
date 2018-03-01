;; flyspell - use aspell instead of ispell
(req-package flyspell
  :diminish flyspell-mode
  :commands (flyspell-mode flyspell-prog-mode)
  :config (setq ispell-program-name (executable-find "aspell")
                ispell-extra-args '("--sug-mode=ultra")))

