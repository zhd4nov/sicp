#lang sicp

(#%require rackunit "../../utils/utils.rkt" "1.06.rkt")

(define (square-iter guess x)
  (if (good-enough? guess x)
      guess
      (square-iter (improve guess x) x)))

; improved good-enough?:

(define (good-enough? guess x)
  (< (abs (- guess (improve guess x) )) 0.0001))

(define (sqrt x)
  (square-iter 1.0 x))

(check-equal? (round (* 1000 (sqrt 4.0))) 2000.0)
(check-equal? (round (* 1000 (sqrt 100.0))) 10000.0)
(check-equal? (round (* 1000 (sqrt 1000000.0))) 1000000.0)
(check-equal? (round (* 1000 (sqrt 0.04))) 200.0)
