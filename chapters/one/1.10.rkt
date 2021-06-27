#lang sicp

(#%require rackunit)

; Ackermann's function (from the book)
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; What are the values of the following expressions?

; (A 1 10)
; (A 2 4)
; (A 3 3)

; Substitution for (A 1 10):
;
; (A 1 10)
; (A 0 (A 1 9))
; (* 2 (A 1 9))
; (* 2 (A 0 (A 1 8)))
; (* 2 (* 2 (A 0 (A 1 7))))
; (* 2 (* 2 (* 2 (A 0 (A 1 6)))))
; (* 2 (* 2 (* 2 (* 2 (A 0 (A 1 5))))))
; (* 2 (* 2 (* 2 (* 2 (* 2 (A 0 (A 1 4)))))))
; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 0 (A 1 3))))))))
; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 0 (A 1 2)))))))))
; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 0 (A 1 1))))))))))
; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 0 2)))))))))
; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 4))))))))
; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 8)))))))
; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 16))))))
; (* 2 (* 2 (* 2 (* 2 (* 2 32)))))
; (* 2 (* 2 (* 2 (* 2 64))))
; (* 2 (* 2 (* 2 128)))
; (* 2 (* 2 256)
; (* 2 512)
; 1024

; (A 2 4) ... monstrous substitution 🥺

; Consider the following procedures, where A is the procedure defined above:

(define (f n) (A 0 n)) ; (= x 0) => (f n) = 2n; (f 5) = (* 2 5) = 10
(define (g n) (A 1 n)) ; (A 1 10) = 2^10 => (g n) = 2^n; (g 1) = 2^1 = 2
(define (h n) (A 2 n)) ; (A 2 4) = 2^2^2^2 = 2^16 = 65536 => (h n) = 2^2...^2, n > 0; (h 3) = 2^2^2 = 16

(check-equal? (f 5) 10)
(check-equal? (g 6) 64)
(check-equal? (h 3) 16)