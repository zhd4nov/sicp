#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (sum-of-square x y)
  (+ (square x) (square y)))

(define (sum-of-larger-squares a b c)
  (cond ((and (< a b) (< a c)) (sum-of-square b c))
        ((and (< b a) (< b c)) (sum-of-square a c))
        (else (sum-of-square a b))))

(check-equal? (sum-of-larger-squares 5 2 1) 29)
(check-equal? (sum-of-larger-squares 1 5 5) 50)
(check-equal? (sum-of-larger-squares 2 2 2) 8)