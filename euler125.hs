-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------

{-
125. Palindromic sums

The palindromic number 595 is interesting because it can be written as the sum of consecutive squares: 6^2 + 7^2 + 8^2 + 9^2 + 10^2 + 11^2 + 12^2.

There are exactly eleven palindromes below one-thousand that can be written as consecutive square sums, and the sum of these palindromes is 4164. Note that 1 = 02 + 12 has not been included as this problem is concerned with the squares of positive integers.

Find the sum of all the numbers less than 10^8 that are both palindromic and can be written as the sum of consecutive squares.
-}

import Data.List
import Data.Numbers.Primes

rmdups :: (Ord a) => [a] -> [a]
rmdups = map head . group . sort

rad n = product $ rmdups $ primeFactors n

solution = snd $ sort [(rad n, n) | n <- [1..100001]] !! 9999

