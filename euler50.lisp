;; ----------------------------
;; |  PROJECT EULER exercise  |
;; ----------------------------

#|
50. Consecutive prime sum

The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
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

(defun prime-sum ()
    (setq res 0)
    (loop for i from 7 to 1000000 do
        (if (primep i) (setq res (+ res i)))
        (if (> res 1000000) (return-from prime-sum (- res i)))
    )
)
