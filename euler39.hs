-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------


{-
39. Integer right triangles

If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?

-}

import Data.Function (on)
import Data.List (maximumBy)

solutions :: Int -> [(Int, Int, Int)]
solutions p = [(a, b, c) | a <- [1..p `quot` 4],
                           let b = (p * (p - 2*a)) `quot` (2 * (p - a)),
                           let c = floor $ sqrt $ fromIntegral (a^2 + b^2),
                           a + b + c == p]

solution = print $ maximumBy (compare `on` (length . solutions)) [2,4..1000]
