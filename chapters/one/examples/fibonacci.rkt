#lang sicp

(#%require rackunit)

; recursive process
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))


;                          fib 5
;                         /     \
;                       fib 4    fib 3 ....
;                     /     \
;                   fib 3    fib 2
;                 /     \       .....
;               fib 2   fib 1
;             /     \
;           fib 1   fib 0

(check-equal? (fib 7) 13)
(check-equal? (fib 10) 55)

; iterative process
(define (iter-fibonacci n)
  (define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))

(check-equal? (iter-fibonacci 7) 13)
(check-equal? (iter-fibonacci 10) 55)