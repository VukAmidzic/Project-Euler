-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------

{-
87. Prime power triples

The smallest number expressible as the sum of a prime square, prime cube, and prime fourth power is 28. In fact, there are exactly four numbers below fifty that can be expressed in such a way:

28 = 2^2 + 2^3 + 2^4
33 = 3^2 + 2^3 + 2^4
49 = 5^2 + 2^3 + 2^4
47 = 2^2 + 3^3 + 2^4

How many numbers below fifty million can be expressed as the sum of a prime square, prime cube, and prime fourth power?

-}

import Data.Numbers.Primes

solution = length $ [a^2 + b^3 + c^4 | a <- p, b <- p, c <- p, a^2 + b^3 + c^4 < limit]
    where limit = 50000000 
          p = [1..limit-1]
          

