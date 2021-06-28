#lang sicp

(#%require rackunit)

; recursive process
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

; substitution:
;
; (factorial 6)
; (* 6 (factorial 5))
; (* 6 (* 5 (factorial 4)))
; (* 6 (* 5 (* 4 (factorial 3))))
; (* 6 (* 5 (* 4 (* 3 (factorial 2)))))
; (* 6 (* 5 (* 4 (* 3 (* 2 (factorial 1))))))
; (* 6 (* 5 (* 4 (* 3 (* 2 1)))))
; (* 6 (* 5 (* 4 (* 3 2))))
; (* 6 (* 5 (* 4 6)))
; (* 6 (* 5 24))
; (* 6 120)
; 720

(check-equal? (factorial 5) 120)
(check-equal? (factorial 6) 720)

; iterative process
(define (iter-factorial n)
  (define (fact-iter result counter)
    (if (> counter n)
        result
        (fact-iter (* counter result)
                   (+ counter 1))))
  (fact-iter 1 1))

; substitution:
;
; (factorial 6)
; (fact-iter 1  1  6)
; (fact-iter 1  2  6)
; (fact-iter 2  3  6)
; (fact-iter 6  4  6)
; (fact-iter 24 5  6)
; (fact-iter 120 6 6)
; (fact-iter 720 7 6)
; 720

(check-equal? (iter-factorial 5) 120)
(check-equal? (iter-factorial 6) 720)