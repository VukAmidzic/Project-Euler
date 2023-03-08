;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
42. Coded triangle numbers

The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for "SKY" is 19 + 11 + 25 = 55 = t_10. If the word value is a triangle number then we shall call the word a triangle word.

Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?

|#

(defun solution ()
    (setq res 0)
    (let 
        ((in (open "words.txt" :if-does-not-exist nil)))
        (when in
            (loop for line = (read-line in nil)
                while line do (if (contains (wordValue (string-to-list line))) (setq res (+ res 1)))
            )
            
            (close in)
        )
    )
    res
)

(defun string-to-list (s)
  (map 'list #'(lambda(x) x) s)
)

(defun sumList (cs)
    (cond 
        ((endp cs) 0)
        (t
            (+ (+ (- (char-code (car cs)) 65) 1) (sumList (cdr cs)))
        )
    )
)

(defun wordValue (s)
    (sumList (string-to-list s))
)

(defun contains (s)
    (loop for n from 1 to s do
        (if (eq (/ (* n (+ n 1)) 2) s) (return-from contains t))
    )
    nil
)
