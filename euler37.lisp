;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
37. Truncatable primes

The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
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


(defun truncatable (n)
    (setq div 10)
    
    (loop
        (when (> div n) (return-from truncatable t))
        
        (if (not (primep (/ n 10))) (return-from truncatable nil))
        (if (not (primep (mod n 10))) (return-from truncatable nil))
        
        (setq div (* div 10))
    )
)

(defun helper (n)
    (and (primep n) (truncatable n))
)

(defun trunc-sum ()
    (setq sum 0)
    (setq num 0)

    (loop for i upfrom 23 by 2 do
        (when (= num 11) (return-from trunc-sum sum))
    
        (if (helper i) (setq sum (+ sum i)) (setq num (+ num 1)))
    )
    sum
)

;; P.S. this solution needs fix!!
