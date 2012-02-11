;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Indentation for some non-standard Scheme syntax forms
;;;

;;;
;;; Indented like BEGIN:
;;;
;;; (begin
;;;   foo
;;;   bar)
;;;
(put 'task 'scheme-indent-function 0)
(put 'pmatch-lambda 'scheme-indent-function 0)


;;;
;;; Indented like LET or LAMBDA:
;;;
;;; (let ((foo 'foo)
;;;       (bar 'bar))
;;;   (cons foo bar))
;;;
;;; (lambda (foo bar)
;;;   'baz)
;;;
(put 'let-values 'scheme-indent-function 1)
(put 'let*-values 'scheme-indent-function 1)
(put 'pmatch 'scheme-indent-function 1)
(put 'syntax-case 'scheme-indent-function 1)
(put 'parametrize 'scheme-indent-function 1)
(put 'dotimes 'scheme-indent-function 1)
(put 'doparray 'scheme-indent-function 1)
(put 'when 'scheme-indent-function 1)
(put 'awhen 'scheme-indent-function 1)
(put 'unless 'scheme-indent-function 1)
(put 'and-let* 'scheme-indent-function 1)
(put 'fluid-let 'scheme-indent-function 1)
(put 'dynamic-let 'scheme-indent-function 1)
(put 'synchronized 'scheme-indent-function 1)
(put 'profile 'scheme-indent-function 1)
(put 'do-drql-results 'scheme-indent-function 1)
(put 'do-query-results 'scheme-indent-function 1)
(put 'task-lambda 'scheme-indent-function 1)
(put 'define-table 'scheme-indent-function 1) ;; for ChristieProject pseudo code
(put 'join 'scheme-indent-function 1) ;; for ChristieProject pseudo code
(put 'left-outer-join 'scheme-indent-function 1) ;; for ChristieProject pseudo code
(put 'make-table 'scheme-indent-function 1) ;; for ChristieProject pseudo code
(put 'reduce 'scheme-indent-function 1) ;; for ChristieProject pseudo code

;;;
;;; Indented like RECEIVE:
;;;
;;; (receive (a b c) (values 1 2 3)
;;;   (list a b c))
;;;
;;; (receive (a b c)
;;;     (values 1 2 3)
;;;   (list a b c))
;;;
;;; (define-bean <Foo>
;;;     (<Bar> <Baz>)
;;;   ((method)
;;;    value))
;;;
(put 'receive 'scheme-indent-function 2)
(put 'profile 'scheme-indent-function 2)
(put 'define-bean 'scheme-indent-function 2)
(put 'define-simple-class 'scheme-indent-function 2)
(put 'apply-let 'scheme-indent-function 2)


(provide 'scheme-indent)