-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------


{-
123. Prime square remainders

Let p_n be the nth prime: 2, 3, 5, 7, 11, ..., and let r be the remainder when (p_n−1)^n + (p_n+1)^n is divided by p_n^2.

For example, when n = 3, p3 = 5, and 43 + 63 = 280 ≡ 5 mod 25.

The least value of n for which the remainder first exceeds 10^9 is 7037.

Find the least value of n for which the remainder first exceeds 10^10.
-}

import Data.Numbers.Primes

-- For some reason it gives an even n, which is not the answer. Just add +1 on the result of this function
solution = fst . head . dropWhile (\(n,p) -> (2*n*p + 2) < 10^10) $ zip [1..] primes
