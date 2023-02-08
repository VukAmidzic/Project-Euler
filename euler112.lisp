;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
112. Bouncy numbers

Working from left-to-right if no digit is exceeded by the digit to its left it is called an increasing number; for example, 134468.

Similarly if no digit is exceeded by the digit to its right it is called a decreasing number; for example, 66420.

We shall call a positive integer that is neither increasing nor decreasing a "bouncy" number; for example, 155349.

Clearly there cannot be any bouncy numbers below one-hundred, but just over half of the numbers below one-thousand (525) are bouncy. In fact, the least number for which the proportion of bouncy numbers first reaches 50% is 538.

Surprisingly, bouncy numbers become more and more common and by the time we reach 21780 the proportion of bouncy numbers is equal to 90%.

Find the least number for which the proportion of bouncy numbers is exactly 99%.
|#

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

(defun solution () 
    (setq start 21780)
    (setq found 19602)
    (loop for i upfrom (+ start 1) do
        (if (eq (and (not(inc (num-to-list i))) (not(dec (num-to-list i)))) t) (setq found (+ found 1))) 
        
        (if (= (* 100 (/ found i)) 99) (return-from solution i))
    )
)

