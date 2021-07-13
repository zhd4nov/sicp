#lang sicp

(#%require rackunit "../../utils/utils.rkt")

; Design a procedure that evolves an iterative exponentiation process that uses successive
; squaring and uses a logarithmic number of steps, as does fast-expt.

(define (fast-expt-iter b n)
    (define (iter b n result)
        (cond ((= n 0) result)
              ((even? n) (iter (square b) (/ n 2) result))
              (else (iter b (- n 1) (* result b)))))
    (iter b n 1))

(check-equal? (fast-expt-iter 10 0) 1)
(check-equal? (fast-expt-iter 3 20) (expt 3 20))
(check-equal? (fast-expt-iter 2 10) (expt 2 10))
(check-equal? (fast-expt-iter 0 5) 0)