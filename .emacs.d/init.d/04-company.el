;; company mode.
(req-package company :ensure t
  :diminish "Company"
  :bind (("C-;" . company-complete-common)
         ("TAB" . company-indent-or-complete-common))
	:defines (company-backends company-backend)
  :commands company-mode
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0.2
	      company-minimum-prefix-length 2
	      company-show-numbers t
	      company-tooltip-limit 10
 	      company-dabbrev-downcase nil
        company-tooltip-align-annotations t))
