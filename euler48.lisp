;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
48. Self powers

The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
|#

(defun num-to-list (n)
    (loop for c across (write-to-string n) collect (digit-char-p c))
)

(defun square (n) (* n n))

(defun pow (b n)
    (cond 
        ((= n 0) 1)
        ((zerop (mod n 2)) (square (pow b (/ n 2))))
        (t (* b (square (pow b (/ (- n 1) 2)))))
    )
)

(defun sum-pows ()
    (setq res 10405071317)
    (setq D (pow 10 10))
    (loop for i from 11 to 1000 do
        (setq res (+ res (pow i i)))
    )
    (mod res D)
)

(defun solution ()
    (sum-pows)
)
