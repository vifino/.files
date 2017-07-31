;; org mode!
(use-package org
  :mode (("\\.org\\'" . org-mode))
  :commands (org-mode org-store-link org-insert-link
             org-agenda-files org-schedule)
  :defines (org-agenda-files)
  :ensure org-plus-contrib)
