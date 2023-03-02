-- ----------------------------
-- |  PROJECT EULER exercise  |
-- ----------------------------


{-
92. Square digit chains

A number chain is created by continuously adding the square of the digits in a number to form a new number until it has been seen before.

For example,

44 → 32 → 13 → 10 → 1 → 1
85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89

Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop. What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.

How many starting numbers below ten million will arrive at 89?
-}

digits :: Int -> [Int]
digits 0 = []
digits x = (mod x 10) : digits (div x 10)

sum_sq_digs :: Int -> Int
sum_sq_digs x = sum $ map (^2) $ reverse $ digits x

chainTo89 :: Int -> Bool
chainTo89 89 = True
chainTo89 1 = False
chainTo89 x = chainTo89 (sum_sq_digs x)

solution = length $ filter (chainTo89) [1..9999999]
