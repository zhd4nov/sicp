#lang sicp

(#%require rackunit)

; describe procedure

; (if (> b 0) + -) return plus if b larger than 0, else is minus
; (returned-operator a b)

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(check-equal? (a-plus-abs-b 2 2) 4)
(check-equal? (a-plus-abs-b 2 (- 2)) 4)