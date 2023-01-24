;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
1. Multiples of 3 or 5

If we list all the natural numbers below 10 that are multiples of 3 or 5,
we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
|#

(defun sumfun (n) 
    (cond 
        ((= n 1) 0)
        (t
          (cond
            ((= (mod n 3) 0) (+ n (sumfun (- n 1))))
            ((= (mod n 5) 0) (+ n (sumfun (- n 1))))
            (t (+ 0 (sumfun (- n 1))))
          )  
        )
    )
)

(defun multiples (n)
    (sumfun (- n 1))
)

(write (multiples 1000))
