;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
20. Factorial digit sum

n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
|#

(defun num-to-list (n)
    (loop for c across (write-to-string n) collect (digit-char-p c))
)

(defun fact (n)
    (cond 
        ((= n 1) 1)
        (t (* n (fact (- n 1)))) 
    )
)

(defun sum-list (ls)
    (cond
        ((endp ls) 0)
        (t (+ (car ls) (sum-list (cdr ls))))
    )
)

(defun res-fun (n)
    (sum-list (num-to-list (fact n)))
)
