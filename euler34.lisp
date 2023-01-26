;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
34. Digit factorials

145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: As 1! = 1 and 2! = 2 are not sums they are not included.
|#

;; Idea for solution: https://www.xarg.org/puzzle/project-euler/problem-34/#:~:text=Project%20Euler%2034%20Solution%3A%20Digit%20factorials%20Problem%2034,the%20sum%20of%20the%20factorial%20of%20their%20digits.

(defun fact (n)
    (cond
        ((= n 1) 1)
        (t (* n (fact (- n 1)))) 
    )
)

(defun num-to-list (n)
    (loop for c across (write-to-string n) collect (digit-char-p c))
)

(defun fact-sum (ls)
    (cond
        ((endp ls) 0)
        (t (+ (fact (car ls)) (fact-sum (cdr ls))))
    )
)

(defun helper (n)
    (fact-sum (num-to-list n))
)

(defun curious ()
    (setq sum 0)
    (loop for i from 10 to 1499999 do
        (if (= i (helper i)) (setq sum (+ sum i)))
    )
    sum
)

#|
P.S. Tested idea in C and it gives the correct solution
|#
