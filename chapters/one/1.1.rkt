#lang sicp

(#%require rackunit "../../utils/utils.rkt")

; just touch racket
; Newton square roots finder by iterative guessing

(define (square-iter guess x)
  (if (good-enough? guess x)
      guess
      (square-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))


(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (square-iter 1.0 x))

; test examples from book

(check-equal? (floor (sqrt 9)) 3.0)
(check-equal? (floor (sqrt 121)) 11.0)
; (check-equal? (floor (sqrt (- 9))) (- 3)) // -> infinite loop ? TODO: fix up... maybe 🤫
(check-equal? (floor (sqrt 0)) 0.0)
(check-not-equal? (floor (sqrt 64)) 999.0)
