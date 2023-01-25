;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
4. Largest palindrome product

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
|#

(defun num-to-list (n)
    (loop for c across (write-to-string n) collect (digit-char-p c))
)

(defun palindrome ()
    (setq res 0)
    (setq tmp 0)
    (loop for p from 1 to 1000 do
        (loop for q from 1 to p do
            (if (equal (num-to-list (* p q)) (reverse (num-to-list (* p q))))
                (setq tmp (* p q))
                (if (> tmp res) (setq res tmp))
            )
            
        )
    )
    res
)
