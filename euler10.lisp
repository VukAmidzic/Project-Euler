;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
10. Summation of primes

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
|#

(defun square (n)
  (* n n))

(defun dividesp (a b)
  (zerop (mod b a)))  
  
(defun find-divisor (n test-divisor)
    (cond ((> (square test-divisor) n) n)
        ((dividesp test-divisor n) test-divisor)
        (t (find-divisor n (+ 1 test-divisor)))
    )
)

(defun smallest-divisor (n)
  (find-divisor n 2))  
  
(defun primep (n)
  (= n (smallest-divisor n)))

(defun solution ()
    (setq res 17)
    (loop for i from 11 to 2000000 do
        (if (primep i) (setq res (+ res i)))
    )
    res
)
