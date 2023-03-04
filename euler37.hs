-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------


{-
37. Truncatable primes

The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.


-}

import Data.Numbers.Primes 

checker' :: Int -> Int -> (Int -> Int -> Int) -> Bool
checker' n d f
    | d > n = True
    | otherwise = isPrime (f n d) && checker' n (10*d) f

checker :: Int -> Bool
checker n = checker' n 10 (mod) && checker' n 10 (div)

solution = sum $ take 11 $ filter (checker) $ filter (>7) primes
