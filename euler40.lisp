;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
40. Champernowne's constant

An irrational decimal fraction is created by concatenating the positive integers:

0.12345678910[1]112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, find the value of the following expression.

d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
|#

(defun num-to-list (n)
    (loop for c across (write-to-string n) collect (digit-char-p c)
    )
)

(defun champer-list (ls)
    (loop for i from 1 to 1000001 do
        (setq ls (append ls (num-to-list i)))
    )
    
    (* (nth 9 ls) (nth 99 ls) (nth 999 ls) (nth 9999 ls) (nth 99999 ls) (nth 999999 ls))
)
