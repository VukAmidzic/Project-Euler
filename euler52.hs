-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------

{-
52. Permuted multiples

It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
-}

import Data.List

digits :: Integer -> [Integer] 
digits x
    | x < 10 = [x]
    | otherwise = digits (div x 10) ++ [mod x 10] 
    
convert_to_matrix x = [(digits x), (digits (2*x)), (digits (3*x)), (digits (4*x)), (digits (5*x)), (digits (6*x))] -- -> res: list of lists

sort_digits x = map (sort) $ convert_to_matrix x

check_f x = and $ map (== head ls) (tail ls)
    where ls = sort_digits x
          
solution = head $ filter (check_f) [1..]
