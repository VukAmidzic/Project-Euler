-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------

{-
131. Prime cube partnership

There are some prime values, p, for which there exists a positive integer, n, such that the expression n^3 + n^2 * p is a perfect cube.

For example, when p = 19, 8^3 + 8^2 * 19 = 12^3.

What is perhaps most surprising is that for each prime with this property the value of n is unique, and there are only four such primes below one-hundred.

How many primes below one million have this remarkable property?
-}

import Data.Numbers.Primes

solution = length $ takeWhile (<1000000) [x |a <- [1..], let x = 3*a*(a+1)+1, isPrime x]
