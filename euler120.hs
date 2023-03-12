-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------


{-
120. Square remainders

Let r be the remainder when (a−1)n + (a+1)n is divided by a2.

For example, if a = 7 and n = 3, then r = 42: 63 + 83 = 728 ≡ 42 mod 49. And as n varies, so too will r, but for a = 7 it turns out that rmax = 42.

For 3 ≤ a ≤ 1000, find ∑ rmax.

-}

import Data.Numbers.Primes

rf n = 2 * n * ((n-1) `div` 2)

solution = sum $ map (rf) [3..1000]
