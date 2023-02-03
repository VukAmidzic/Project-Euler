;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
7. 10001st prime

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
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
    (setq cnt 0)
    (loop for i upfrom 2 do
        (if (primep i) (setq cnt (+ cnt 1)))
        (if (= cnt 10001) (return-from solution i))
    )
)
