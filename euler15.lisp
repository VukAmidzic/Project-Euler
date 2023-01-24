;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
15. Lattice paths

Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner (without backtracking).

How many such routes are there through a 20×20 grid?
|#

;; Idea for solution : https://projecteuler.net/thread=15

(defun fact (n)
    (cond 
        ((= n 1) 1)
        (t (* n (fact (- n 1))))
    )
)

(defun solution (n)
    (/ (fact (* n 2)) (* (fact n) (fact n)))
)
