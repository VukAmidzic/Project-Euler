-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------

{-
119. Digit power sum

The number 512 is interesting because it is equal to the sum of its digits raised to some power: 5 + 1 + 2 = 8, and 8^3 = 512. Another example of a number with this property is 614656 = 28^4.

We shall define an to be the nth term of this sequence and insist that a number must contain at least two digits to have a sum.

You are given that a_2 = 512 and a_10 = 614656.

Find a_30.

-}

import Data.List

digits n 
    | n < 10 = [n]
    | otherwise = digits (n `div` 10) ++ [n `mod` 10]
    
solution = sort [(a^b) | a <- [2..200], b <- [2..9], 
        let m = (a^b), 
        let n = sum $ digits m, 
        n == a] !! 29
                                                         

