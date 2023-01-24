;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
5. Smallest multiple

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
|#

(defun largest-lcm (n)
    (setq res 2)
    (loop for i from 3 to n do
        (setq res (lcm res i))
    )
    res
)

(write (largest-lcm 20))


