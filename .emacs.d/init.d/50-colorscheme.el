;; Colorscheme
(setq custom-theme-directory "~/.emacs.d/themes/"
      custom-safe-themes t)

(use-package doom-themes :ensure t
  :config
	(setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
	(load-theme 'doom-vibrant t)
	(doom-themes-visual-bell-config))
