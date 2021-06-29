#lang sicp

(#%require rackunit)

; A function f is defined by the rule that f(n) = n if n<3
; and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. 
;
; Write a procedure that computes f by means of a recursive process. 
; Write a procedure that computes f by means of an iterative process.

; recursive
(define (recursive-f n)
  (if (< n 3)
      n
      (+ (recursive-f (- n 1))
         (recursive-f (- n 2))
         (recursive-f (- n 3)))))

(check-equal? (recursive-f 3) 3)
(check-equal? (recursive-f 4) 6)
(check-equal? (recursive-f 5) 11)

; iterative
(define (iterative-f n)
  (define (iter a b c count)
    (if (= count 0)
        c
        (iter (+ a b c) a b (- count 1))))
  (iter 2 1 0 n))

(check-equal? (iterative-f 3) 3)
(check-equal? (iterative-f 4) 6)
(check-equal? (iterative-f 5) 11)