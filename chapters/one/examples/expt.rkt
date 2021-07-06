#lang sicp

(#%require rackunit)

; recursive process
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(check-equal? (expt 2 4) 16)
(check-equal? (expt 2 10) 1024)
(check-equal? (expt 2 0 ) 1)
(check-equal? (expt 0 5 ) 0)

; iterative process
(define (i-expt b n)
  (define (expt-iter b counter product)
    (if (= counter 0)
        product
        (expt-iter b
                   (- counter 1)
                   (* b product))))
  (expt-iter b n 1))

(check-equal? (i-expt 2 4) 16)
(check-equal? (i-expt 2 10) 1024)
(check-equal? (i-expt 2 0 ) 1)
(check-equal? (i-expt 0 5 ) 0)