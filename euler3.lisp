;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
3. The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143?
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
  
(defun max-prime ()
    (setq d 2)
    (loop with n = 600851475143 for i from 3 to (sqrt n) do
        (when (and (= 0 (mod n i)) (primep i)) (setq d i))
    )
    d
)

(write (max-prime))
