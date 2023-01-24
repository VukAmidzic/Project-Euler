;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
6. Sum square difference

The sum of the squares of the first ten natural numbers is,

                    1^2 + 2^2 + ... + 10^2 = 385 

The square of the sum of the first ten natural numbers is,

                    (1 + 2 + ... + 10)^2 = 3025
                        
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
|#

(defun sum-n (n)
    (cond
        ((= n 1) 1)
        (t (+ n (sum-n (- n 1))))
    )
)

(defun square-sum-n (n)
    (* (sum-n n) (sum-n n))
)

(defun sum-squares-n (n)
    (/ (* n (* (+ (* n 2) 1) (+ n 1))) 6)
)

(write (- (square-sum-n 100) (sum-squares-n 100)))
