;; Python settings
(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode))

(use-package company-jedi :ensure t
  :after (python company))

(defun vifino/python-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'vifino/python-hook)
