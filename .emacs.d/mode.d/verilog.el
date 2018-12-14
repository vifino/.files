;; Verilog.

(use-package verilog-mode
  :mode (("\\.[st]*v[hp]*\\'" . verilog-mode) ;.v, .sv, .svh, .tv, .vp
         ("\\.psl\\'"         . verilog-mode)
         ("\\.vams\\'"        . verilog-mode)
         ("\\.vinc\\'"        . verilog-mode))
  :config
  (add-hook 'verilog-mode-hook
            '(lambda ()
               (add-hook 'write-file-functions
                         (lambda()
                           (untabify (point-min) (point-max))
                           nil)))))
