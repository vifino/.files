;; Small things.
;; Very handy little things.
;; Not worth own files.
;; Mostly 'sane' (for me) defaults.

;; ido - ivy now
;(require 'ido)
;(ido-mode t)
;(setq ido-enable-flex-matching t)

;(global-set-key (kbd "C-x C-b") 'ibuffer)
;(global-set-key (kbd "C-s") 'isearch-forward-regexp)
;(global-set-key (kbd "C-r") 'isearch-backward-regexp)
;(global-set-key (kbd "C-M-s") 'isearch-forward)
;(global-set-key (kbd "C-M-r") 'isearch-backward)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; * bar modes
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

(setq inhibit-default-init t
      load-prefer-newer t
      enable-recursive-minibuffers t
      ediff-window-setup-function 'ediff-setup-windows-plain
      make-backup-files nil
      auto-save-default nil
      gc-cons-threshold (* 10 1024 1024)
      large-file-warning-threshold (* 10 1024 1024)
      dired-use-ls-dired nil)

;; small keybinding
(use-package compile
  :functions compile
  :defines compile-command
  :bind (("<f5>" . compile)))