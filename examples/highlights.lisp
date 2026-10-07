(defpackage #:zed-common-lisp-example
  (:use #:cl)
  (:export #:greet))

(in-package #:zed-common-lisp-example)

(defun greet (name &key (punctuation "!"))
  "Return a friendly greeting for NAME."
  (format nil "Hello, ~A~A" name punctuation))

(defmacro when-let ((variable value) &body body)
  `(let ((,variable ,value))
     (when ,variable
       ,@body)))

(loop for value in '(1 2 3 4 5)
      when (oddp value)
        collect value)
