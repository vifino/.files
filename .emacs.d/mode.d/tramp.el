;; Tramp settings.
;; Not really a language, but close enough.

(req-package tramp
	:commands (tramp-version tramp-cleanup-all-buffers)
  :config
  (progn
    (setq tramp-default-mode "ssh"
          tramp-ssh-controlmaster-options (concat "-o ControlPath=/tmp/ssh-%%r@%%h:%%p"
                                                  "-o ControlMaster=auto"
                                                  "-o ControlPersist=600"))
    (defalias 'exit-tramp 'tramp-cleanup-all-buffers)))
