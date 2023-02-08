;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
113. Non-bouncy numbers

Working from left-to-right if no digit is exceeded by the digit to its left it is called an increasing number; for example, 134468.

Similarly if no digit is exceeded by the digit to its right it is called a decreasing number; for example, 66420.

We shall call a positive integer that is neither increasing nor decreasing a "bouncy" number; for example, 155349.

As n increases, the proportion of bouncy numbers below n increases such that there are only 12951 numbers below one-million that are not bouncy and only 277032 non-bouncy numbers below 10^10.

How many numbers below a googol (10^100) are not bouncy?
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

(defun inc (ls)
    (loop
        (cond 
            ((= 1 (list-length ls)) (return-from inc t))
            (t
                (cond 
                    ((> (car ls) (car (cdr ls))) (return-from inc nil)) 
                    (t (setq ls (cdr ls)))
                )
            )
        )
    )
)

(defun dec (ls)
    (loop
        (cond 
            ((= 1 (list-length ls)) (return-from dec t))
            (t
                (cond 
                    ((< (car ls) (car (cdr ls))) (return-from dec nil)) 
                    (t (setq ls (cdr ls)))
                )
            )
        )
    )
)

(defun solution (l r) 
    (setq not_bouncy 0)
    (loop for i from (+ (pow 10 l) 1) to (pow 10 r)  do
        (if (eq (or (not(inc (num-to-list i))) (not(dec (num-to-list i)))) t) (setq not_bouncy (+ not_bouncy 1))) 
    )
    not_bouncy
)

;; P.S this solution is very slow; needs rework
