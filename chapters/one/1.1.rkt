#lang sicp

(#%require rackunit)

;check env
(define (square x) (* x x))

(define answer (square 2))

(check-equal? answer 4)

(define (sum-of-square x y)
  (+ (square x) (square y)))

(check-equal? (sum-of-square 5 10) 125)

(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))

(check-equal? (abs -1) 1)
(check-equal? (abs 1) 1)
(check-equal? (abs 0) 0)

(define (>= x y) (if (< x y) #f #t))

(check-true (>= 2 0))
(check-true (>= 0 0))
(check-false (>= (- 2) 0))