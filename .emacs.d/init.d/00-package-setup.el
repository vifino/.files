;; Packages! Yay!

;; Define GNU, MELPA and Marmalade as our package sources.
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("marmalade" . "https://marmalade-repo.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

;; Install use-package
(eval-when-compile
  (progn
    (if (not (package-installed-p 'use-package))
        (progn
          (package-refresh-contents)
          (package-install 'use-package)))
    (if (not (package-installed-p 'diminish))
        (progn
          (package-refresh-contents)
          (package-install 'diminish)))
    (require 'use-package)
    (add-to-list 'load-path "~/.emacs.d/pkg")))

(require 'diminish)
(require 'bind-key)
;; (setq use-package-always-ensure t)
