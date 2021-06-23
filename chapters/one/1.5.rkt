#lang sicp

; describe Ben Bitdiddle's test
; self referencing procedure that will end up in endless recursion when evaluated
; (define (p) (p)) // racket doesn't allow even define this

; test is procedure that has 2 branches based on input x so we can choose if we evaluate the second branch.

(define (test x y)
  (if (= x 0)
      0
      y))

; (test 0 (p))

; Normal order:
;   In this case operand (p) will not be evaluated until it is needed by
;   some primitive operation and thus this will return 0 as result.
;
; Applicative order:
;   In this case operand y will be by default evaluated and then it will
;   end up in recursion since (p) points to itself.