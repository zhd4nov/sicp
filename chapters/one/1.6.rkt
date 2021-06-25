#lang sicp

; describe new-if problem

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; Square root expressed in terms of new-if method

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; native if is a special form but new-if is a primitive procedure.
; due to applicative order of evaluation interpreter will try to evaluate all of arguments at first
; in the new-if case recursion won't end but in the case of a special form sqrt-iter
; works – parameters will be evaluate in every step, in one moment.
