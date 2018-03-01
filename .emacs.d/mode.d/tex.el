;; LaTeX stuff:
;;  - AUCTeX
;;  - RefTeX
;;  - company-auctex
(req-package reftex :ensure t
  :diminish "RefTeX"
  :commands (reftex-mode)
  :defines reftex-plug-into-AUCTex
  :config
  (setq reftex-plug-into-AUCTeX t)
  :init
  (add-hook 'LaTeX-mode-hook #'reftex-mode))

(req-package tex
  :ensure auctex
  :mode ("\\.tex\\'" . TeX-latex-mode)
  :diminish (LaTeX-mode . "LaTeX")
  :commands (LaTeX-mode)
  :init
  (require 'texmathp)
  (setq TeX-auto-save t
        TeX-parse-self t)
  (add-hook 'LaTeX-mode-hook '(lambda ()
                                (LaTeX-math-mode 1)
                                (TeX-fold-mode 1)
                                (TeX-PDF-mode 1)
                                (outline-minor-mode 1)
                                (flycheck-mode 1))))

(req-package company-auctex :ensure t
  :commands company-auctex-mode
  :init
  (add-hook 'LaTeX-mode-hook #'company-auctex-init))
