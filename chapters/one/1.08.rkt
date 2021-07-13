#lang sicp

(#%require rackunit "../../utils/utils.rkt")

(define (сbrt-iter guess x) 
  (if (good-enough? guess x) 
      guess 
      (сbrt-iter (improve guess x) 
                 x)))

(define (improve guess x)
    (/ (+ (/ x (square guess)) 
            (* 2 guess)) 
         3))

(define (good-enough? guess x) 
      (< (abs (- guess (improve guess x))) 0.0001))

(define (cbrt x)
  (сbrt-iter 1.0 x))

(check-equal? (round (* 1000 (cbrt 8.0))) 2000.0)
(check-equal? (round (* 1000 (cbrt 1000.0))) 10000.0)
(check-equal? (round (* 1000 (cbrt 1000000000.0))) 1000000.0)
(check-equal? (round (* 1000 (cbrt 0.008))) 200.0)