;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
12. Highly divisible triangular number

The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

                1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

Let us list the factors of the first seven triangle numbers:

    1: 1
    3: 1,3
    6: 1,2,3,6
    10: 1,2,5,10
    15: 1,3,5,15
    21: 1,3,7,21
    28: 1,2,4,7,14,28

We can see that 28 is the first triangle number to have over five divisors.

What is the value of the first triangle number to have over five hundred divisors?

|#

(defun divisors (n) 
    (setq res 0)
    (loop for i from 1 to n do
        (if (zerop (mod n i)) (setq res (+ res 1)))
    )
    res
)

(defun triangle ()
    (loop with n = 0 for i from 1 to 10000 do 
        (incf n i)
        (if (> (divisors n) 500) (return-from triangle n))
    )
)

#|
P.S. this solution needs some rework due to being very slow.
|#