;; Load language specific configs
;; Doesn't selectively load them, that's in the files.
(eval-and-compile
  (floaddir "~/.emacs.d/mode.d"))
