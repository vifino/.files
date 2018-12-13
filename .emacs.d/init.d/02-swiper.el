;; ivy, counsel and swiper.
;; big part stolen from https://pastebin.com/g867n8h6

(use-package ivy :ensure t
  :diminish "Ivy"
  :commands (ivy-read ivy--reset-state)
  :bind
  (("C-c C-r" . ivy-resume)
   ("C-x b" . ivy-switch-buffer)
   ("C-c i M" . ivy-imenu-anywhere)
   :map ivy-mode-map
   ("C-'" . ivy-avy)
   :map ivy-minibuffer-map
   ("M-RET" . ivy-next-line-and-call))
  :init
  (defalias 'ido-mode-real 'ido-mode)
  (defalias 'ido-mode 'ivy-mode)
  (with-eval-after-load 'ido
    (ido-mode-real -1)
    (ivy-mode 1))
  (setq ivy-use-virtual-buffers nil
        ivy-height 11
        ivy-initial-inputs-alist nil
        ivy-count-format "%d/%d "
        ivy-virtual-abbreviate 'full ; Show the full virtual file paths
        ivy-extra-directories '("./") ; default value: ("../" "./")
        ivy-wrap t
        ivy-re-builders-alist '((swiper . ivy--regex-plus)
                                (counsel-ag . ivy--regex-plus)
                                (counsel-grep-or-swiper . ivy--regex-plus)
                                (t . ivy--regex-fuzzy))))

(use-package counsel :ensure t
  :diminish "Counsel"
  :bind*
  (("M-x" . counsel-M-x)
   ("C-c d d" . counsel-descbinds)
   ("C-c s d" . counsel-rg)
   ("C-x C-f" . counsel-find-file)
   ("C-x r f" . counsel-recentf)
   ("C-c g g" . counsel-git)
   ("C-c s g" . counsel-git-grep)
   ("C-x l" . counsel-locate)
   ("C-c g s" . counsel-grep-or-swiper)
   ("C-M-y" . counsel-yank-pop)
   ("C-c i m" . counsel-imenu)
   ("C-c d s" . describe-symbol))

  :config
  (defun reloading (cmd)
    (lambda (x)
      (funcall cmd x)
      (ivy--reset-state ivy-last)))
  (defun given-file (cmd prompt) ; needs lexical-binding
    (lambda (source)
      (let ((target
             (let ((enable-recursive-minibuffers t))
               (read-file-name
                (format "%s %s to:" prompt source)))))
        (funcall cmd source target 1))))
  (defun confirm-delete-file (x)
    (dired-delete-file x 'confirm-each-subdirectory))

  (setq counsel-find-file-at-point t)
  ;; ignore . files or temporary files
  (setq counsel-find-file-ignore-regexp
        (concat
         ;; File names beginning with # or .
         "\\(?:\\`[#.]\\)"
         ;; File names ending with # or ~
         "\\|\\(?:\\`.+?[#~]\\'\\)")))

(use-package swiper :ensure t
  :diminish "Swiper"
  :bind
  (("C-s" . swiper)
   :map isearch-mode-map
   ("M-i" . swiper-from-isearch)))
