;; flyspell - use aspell instead of ispell
(use-package flyspell
  :diminish "Flyspell"
  :commands (flyspell-mode flyspell-prog-mode)
  :config (setq ispell-program-name (executable-find "aspell")
                ispell-extra-args '("--sug-mode=ultra")))

