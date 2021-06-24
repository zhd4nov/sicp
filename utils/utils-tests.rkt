#lang sicp

(#%require rackunit "utils.rkt")

; square:
(check-equal? (square 2) 4)
(check-equal? (square 0) 0)

; sum-of-square:
(check-equal? (sum-of-square 5 10) 125)
(check-equal? (sum-of-square 1 0) 1)

; abs:
(check-equal? (abs -1) 1)
(check-equal? (abs 1) 1)

; larger or equal:
(check-true (>= 2 0))
(check-true (>= 0 0))
(check-false (>= (- 2) 0))