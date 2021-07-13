#lang sicp

(#%provide square >= average abs sum-of-square сube even? expt)

(define (square x) (* x x))

(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))

(define (sum-of-square x y)
  (+ (square x) (square y)))

(define (>= x y) (if (< x y) #f #t))

(define (average x y)
  (/ (+ x y) 2.0))

(define (сube x) (* x x x))

(define (even? x)
    (= (remainder x 2) 0))

(define (expt b n)
  (define (expt-iter b counter product)
    (if (= counter 0)
        product
        (expt-iter b
                   (- counter 1)
                   (* b product))))
  (expt-iter b n 1))