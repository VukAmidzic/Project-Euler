;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
16. Power digit sum

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
|#

(defun square (n) (* n n))

(defun pow (b n)
    (cond 
        ((= n 0) 1)
        ((zerop (mod n 2)) (square (pow b (/ n 2))))
        (t (* b (square (pow b (/ (- n 1) 2)))))
    )
)

(defun num-to-list (n)
    (loop for c across (write-to-string n) collect (digit-char-p c))
)

(defun sum-list (ls)
    (cond
        ((endp ls) 0)
        (t (+ (car ls) (sum-list (cdr ls))))
    )
)

(defun solution-sum (b n)
    (sum-list (num-to-list (pow b n)))
)
