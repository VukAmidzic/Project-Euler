-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------


{-
35. Circular primes

The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
-}

import Data.Numbers.Primes
import Data.List
import Data.Digits  

get_circ_primes :: [Int] -> [Int]
get_circ_primes [] = []
get_circ_primes (x:xs) 
    | all isPrime p = x : get_circ_primes xs
    | otherwise = get_circ_primes xs
    where p = map (unDigits 10) $ permutations $ digits 10 x 
          
-- P.S this solution needs fix!!
    

