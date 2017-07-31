; Get closest pathname for file.
; uses find-nearest-file

(eval-when-compile
  (defun get-closest-pathname (file)
    "recursively searches upwards from buffer's current dir for file and returns that dir. Or erroring out if not found or if buffer is not visiting a file"
    (if (buffer-file-name)
        (find-nearest-file (buffer-file-name) file)
      (error "Buffer is not visiting a file"))))
