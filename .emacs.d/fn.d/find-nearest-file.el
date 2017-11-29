; find the nearest file
; adapted/stolen from https://www.emacswiki.org/emacs/CompileCommand#toc5

(eval-when-compile
  (require 'cl)
  (defun find-nearest-file (path file)
    "recursively searches upwards from path for file and returns that dir. Or erroring out if not found."
    (let* ((parent (file-name-directory path))
           (possible-file (concat parent file)))
      (cond
       ((file-exists-p possible-file)
        possible-file)
       ((string= (concat (expand-file-name "/")) possible-file)
        (error "No file named %s found" file))
       (t (find-nearest-file (directory-file-name parent) file))))))
