;; Colorscheme
(setq custom-theme-directory "~/.emacs.d/themes/"
      custom-safe-themes t)

(use-package autothemer :ensure t
	:commands (autothemer-deftheme))

(load-theme 'darktooth)
