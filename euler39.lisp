;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
39. Integer right triangles

If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?
|#

(defun int-right-tri (n)
    (setq maxc 0)
    (setq maxp 0)
    (loop for p from 2 to (+ n 1) by 2 do
        (setq c 0)
        
        (loop for a from 2 to (/ p 3) do
            (if (zerop (round (mod (* p (- p (* a 2))) (* 2 (- p a)))))
                (setq c (+ c 1))
            )
        )
        
        (if (> c maxc) (setq maxc c) (setq maxp p))
    )
    maxp
)

;; P.S. this solution needs fix!
