;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
56. Powerful digit sum

A googol (10100) is a massive number: one followed by one-hundred zeros; 100100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.

Considering natural numbers of the form, ab, where a, b < 100, what is the maximum digital sum?
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

(defun solution ()
    (setq res 0)
    (loop for a from 90 to 100 do
        (loop for b from 90 to 100 do
            (setq tmp (sum-list (num-to-list (pow a b))))
            (if (> tmp res)
                (setq res tmp)
            )
        )
    )
    res
)
