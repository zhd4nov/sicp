#lang sicp

(#%provide square >= average abs sum-of-square сube)

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