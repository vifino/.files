;; Colorscheme
(setq custom-theme-directory "~/.emacs.d/themes/"
      custom-safe-themes t)

;(req-package autothemer :ensure t
;  :commands (autothemer-deftheme))

(req-package doom-themes :ensure t
  :config
	(setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
	(load-theme 'doom-vibrant t)
	(doom-themes-visual-bell-config))
