-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------


{-
47. Distinct primes factors

The first two consecutive numbers to have two distinct prime factors are:

14 = 2 × 7
15 = 3 × 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19.

Find the first four consecutive integers to have four distinct prime factors each. What is the first of these numbers?
-}


import Data.Numbers.Primes (primeFactors)
import Data.List

distinct_primes n = length $ map (length) $ group $ primeFactors n

solution = head [x | x <- [210..], distinct_primes x == 4, distinct_primes (x+1) == 4, distinct_primes (x+2) == 4, distinct_primes (x+3) == 4] 
