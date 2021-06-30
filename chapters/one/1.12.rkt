#lang sicp

(#%require rackunit)

; Pascal's triangle:

;    rows
;      ^
;    I |         1
;   II |       1   1
;  III |     1   2   1
;   IV |   1   3   3   1
;    V | 1   4   6   4   1
;       --------------------> places
;        I  II  III  IV  V

; Procedure computes elements of Pascal's triangle with recursive process:

(define (get-triangle-element row place)
  (cond ((or (= place 1) (= place row)) 1)
        ((and (> place 1) (< place row)) (+ (get-triangle-element (- row 1) (- place 1))
                                            (get-triangle-element (- row 1) place)))))

(check-equal? (get-triangle-element 3 2) 2)
(check-equal? (get-triangle-element 4 2) 3)
(check-equal? (get-triangle-element 5 3) 6)